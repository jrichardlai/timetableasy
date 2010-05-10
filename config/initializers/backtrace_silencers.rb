# Be sure to restart your server when you modify this file.

# You can add backtrace silencers for libraries that you're using but don't wish to see in your backtraces.
# Rails.backtrace_cleaner.add_silencer { |line| line =~ /my_noisy_library/ }

# You can also remove all the silencers if you're trying do debug a problem that might steem from framework code.
# Rails.backtrace_cleaner.remove_silencers!

Date.class_eval do

  def to_s( format_name = :default )
    format = case format_name
    when String
      self.strftime( format )
    when Symbol
      I18n.localize( self, :format => format_name)
    end
  end

end

Time.class_eval do

  def to_s( format_name = :default )
    format = case format_name
    when String
      self.strftime( format )
    when Symbol
      I18n.localize( self, :format => format_name)
    end
  end

end