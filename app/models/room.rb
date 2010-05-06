class Room < ActiveRecord::Base
  belongs_to :campus
  
  validates_presence_of :campus
  
  def used_at?(date)
    not Event.with_room(self).all(:conditions => ["? > begin_at and ? < end_at ", date, date]).empty?
  end

  def used_between?(start_date, end_date)
    used_at?(start_date) | used_at?(end_date)
  end
end
