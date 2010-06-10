class Room < ActiveRecord::Base
  belongs_to :campus
  
  validates_presence_of :campus
  
  def used_at?(date, except_event_id = nil)
    if (except_event_id)
      not Event.with_room(self).all(:conditions => ["? > begin_at and ? < end_at and events.id != ?", date, date, except_event_id]).empty?
    else
      not Event.with_room(self).all(:conditions => ["? > begin_at and ? < end_at ", date, date]).empty?
    end
  end

  def used_between?(start_date, end_date, except_event_id = nil)
    used_at?(start_date, except_event_id) | used_at?(end_date, except_event_id)
  end
end
