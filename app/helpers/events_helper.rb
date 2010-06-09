module EventsHelper
  def time_options
    @time_options ||= (0..23).map {|number| ["#{number.to_s.rjust(2, '0')}:00", "#{number.to_s.rjust(2, '0')}:00"]}
  end

  def room_select_options
    if current_user.manager?
      @room_select_options ||= current_user.campuses.collect(&:rooms).flatten
    else
      Room.all
    end
  end
end
