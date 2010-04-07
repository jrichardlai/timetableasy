class Event < ActiveRecord::Base

  before_validation :set_time, :if => :time_to_parse?

  named_scope :occurs_between, lambda { |from, to| { :conditions => ["begin_at >= ? and end_at <= ?", Time.at(from.to_i), Time.at(to.to_i)] } if from and to }

  attr_accessor :start_day, :end_day, :start_time, :end_time
  
  validates_presence_of :begin_at
  validates_presence_of :end_at
  validate :valid_dates?

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
    {:id => id, :title => name, :className => '', :description => description, :start => begin_at.iso8601, :end => end_at.iso8601}
  end

  def self.to_fullcalendar(from, to)
    occurs_between(from, to).collect(&:to_fullcalendar).to_json
  end
end
