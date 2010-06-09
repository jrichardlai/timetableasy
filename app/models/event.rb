class Event < ActiveRecord::Base

  before_validation :set_time, :if => :time_to_parse?

  named_scope :occurs_between,  lambda { |from, to| { :conditions => ["begin_at >= ? and end_at <= ?", Time.at(from.to_i), Time.at(to.to_i)] } if from and to }
  named_scope :whos_speaker,    lambda {|speaker|   {:conditions => {:speaker_id => speaker.id}}}
  named_scope :with_room,       lambda {|room|      {:conditions => {:room_id => room.id}}}
  named_scope :mandatory,       :conditions => {:force_display => true}
  belongs_to  :event_type
  belongs_to  :room
  belongs_to  :speaker, :class_name => 'User'

  EVENT_SCOPES = ['campus', 'cursus', 'periods', 'classroom', 'user']

  # Define named scopes for event scopes
  EVENT_SCOPES.each do |scope|
    named_scope "for_#{scope}".to_sym, lambda {|r| {:conditions => {:event_scope_type => scope.camelize.to_s, :event_scope_id => (r.is_a?(Array) ? r.collect(&:id) : r.id)} }}
  end

  named_scope :whos_speaker, lambda {|user| {:conditions => {:speaker_id => user.id}}}
  named_scope :global_event, :conditions => {:global_event => true}
  attr_accessor :start_day, :end_day, :start_time, :end_time
  
  validates_presence_of :begin_at
  validates_presence_of :end_at

  validate :speaker_not_busy?, :if => :speaker
  validate :room_not_used?, :if => :room
  validate :valid_dates?
  validate :event_scope_should_have_id
  
  before_validation :add_to_current_user_events, :unless => :has_scope?
  belongs_to :event_scope, :polymorphic => true
  belongs_to :teaching_method
  belongs_to :school_subject

  validates_presence_of :teaching_method, :if => :school_subject

  delegate :name, :to => :event_type, :allow_nil => true, :prefix => :event_type

  def time_to_parse?
    start_day or end_day or start_time or end_time
  end

  def start_day
    return @start_day if @start_day
    begin_at.strftime("%d/%m/%Y") if begin_at
  end

  def start_time
    return @start_time if @start_time
    begin_at.strftime("%H:%M") if begin_at
  end

  def end_day
    return @end_day if @end_day
    end_at.strftime("%d/%m/%Y") if end_at
  end

  def end_time
    return @end_time if @end_time
    end_at.strftime("%H:%M") if end_at
  end

  def set_time
    self.begin_at = DateTime.strptime "#{start_day} #{start_time}", '%d/%m/%Y %H:%M'
    self.end_at   = DateTime.strptime "#{end_day} #{end_time}", '%d/%m/%Y %H:%M'
  end

  def display_name
    if teaching_method
      "#{school_subject.name} (#{I18n.t("teaching_methods.teaching_type.#{teaching_method.teaching_type}")}) #{ name.blank? ? '' : "- #{name}" }"
    else
      name
    end
  end

  def has_scope?
    global_event? or event_scope_id
  end
  
  def add_to_current_user_events
    self.event_scope = User.current_user if User.current_user
  end

  def to_fullcalendar
    {:id => id, :title => display_name, :description => description, :start => begin_at.iso8601, :end => end_at.iso8601, :className => (global_event ? 'university' : event_scope_type.downcase)}
  end

  def organizer
    speaker ? speaker.name : speaker_name
  end

  def location
    room ? room.name : room_name
  end

  def duration
    end_at - begin_at
  end

  #cumulate events for an user or an campus or a class
  def self.cumulated(from = nil, to = nil, only_mandatory = false, record = nil)
    search = self
    search = occurs_between(from, to) if from and to
    search = search.mandatory if only_mandatory
    if record
      class_name = record.class.to_s.downcase 
      if class_name == 'user'
        search.or_scopes record.cumulated_options
      else
        #search hierarchycal events
        EVENT_SCOPES[0, EVENT_SCOPES.index(class_name)].inject([:global_event]){|array, scope| array + ["for_#{scope}".to_sym, record.send(scope).id]}
      end
    end
  end

  def self.to_fullcalendar(from, to, only_mandatory = false, record = nil)
    self.cumulated(from, to, only_mandatory, record).collect(&:to_fullcalendar).to_json
  end

  def self.to_ical(user)
    events = self.cumulated(nil, nil, nil, user)
    cal = Icalendar::Calendar.new
    cal.custom_property("METHOD","PUBLISH")
    events.each do |event|
      cal.event do
        created       event.created_at.strftime("%Y%m%dT%H%M%S")
        organizer     event.organizer
        dtstart       event.begin_at.strftime("%Y%m%dT%H%M%S")
        dtend         event.end_at.strftime("%Y%m%dT%H%M%S")
        summary       event.display_name
        last_modified event.updated_at.strftime("%Y%m%dT%H%M%S")
        description   event.description
        klass         "PUBLIC"
        location      event.location
      end
    end
    cal.to_ical
  end

  private

  def valid_dates?
    return false unless self.begin_at and self.end_at
    errors.add_to_base(I18n.t("errors.anterior_dates")) unless self.begin_at < self.end_at
  end

  def speaker_not_busy?
    errors.add_to_base(I18n.t("errors.speaker_busy")) if speaker.busy_between?(begin_at, end_at, try(:id))
  end

  def room_not_used?
    errors.add_to_base(I18n.t("errors.room_used")) if room.used_between?(begin_at, end_at, try(:id))
  end

  def event_scope_should_have_id
    errors.add_to_base(I18n.t("errors.should_have_id")) if not event_scope_type.blank? and event_scope_id.blank?
  end
end