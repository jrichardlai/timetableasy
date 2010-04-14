class Event < ActiveRecord::Base

  before_validation :set_time, :if => :time_to_parse?

  named_scope :occurs_between, lambda { |from, to| { :conditions => ["begin_at >= ? and end_at <= ?", Time.at(from.to_i), Time.at(to.to_i)] } if from and to }
  named_scope :mandatory, :conditions => {:force_display => true}

  EVENT_SCOPES = ['campus', 'cursus', 'promotion', 'classroom', 'user']

  # Define named scopes for event scopes
  EVENT_SCOPES.each do |scope|
    named_scope "for_#{scope}".to_sym, lambda {|r| {:conditions => {:event_scope_type => scope.classify.to_s, :event_scope_id => r.id} }}
  end

  named_scope :whos_speaker, lambda {|user| {:conditions => {:speaker_id => user.id}}}
  named_scope :global_event, :conditions => {:global_event => true}
  attr_accessor :start_day, :end_day, :start_time, :end_time
  
  validates_presence_of :begin_at
  validates_presence_of :end_at
  validate :valid_dates?
  belongs_to :event_scope, :polymorphic => true
  belongs_to :academical, :polymorphic => true

  def time_to_parse?
    start_day or end_day or start_time or end_time
  end

  def set_time
    self.begin_at = DateTime.strptime "#{start_day} #{start_time}", '%d/%m/%Y %H:%M'
    self.end_at   = DateTime.strptime "#{end_day} #{end_time}", '%d/%m/%Y %H:%M'
  end

  def valid_dates?
    return false unless self.begin_at and self.end_at
    errors.add_to_base("anterior_dates") unless self.begin_at < self.end_at
  end

  def to_fullcalendar
    {:id => id, :title => name, :description => description, :start => begin_at.iso8601, :end => end_at.iso8601, :className => (global_event ? 'university' : event_scope_type.downcase)}
  end

  #cumulate events for an user or an campus or a class
  def self.cumulated(from, to, only_mandatory = false, record = nil)
    search = occurs_between(from, to)
    search.mandatory if only_mandatory
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
    self.cumulated(from, to, mandatory, record).collect(&:to_fullcalendar).to_json
  end

end