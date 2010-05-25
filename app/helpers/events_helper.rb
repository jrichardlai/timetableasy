module EventsHelper
  def time_options
    @time_options ||= (0..23).map {|number| ["#{number.to_s.rjust(2, '0')}:00", "#{number.to_s.rjust(2, '0')}:00"]}
  end
end
