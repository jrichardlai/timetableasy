# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  include AuthenticatedSystem

  before_filter :set_locale
  before_filter :set_current_user

  helper_method :locale_accepted

  def set_locale
     #Dev purpose Only
     logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
     #To delete ...
     I18n.locale = params[:locale] || extract_locale_from_accept_language_header
     logger.debug "* Locale set to '#{I18n.locale}'"
  end

  def locale_accepted
    ['fr', 'en', 'es']
  end
  
  def set_current_user
    User.current_user = current_user if current_user
  end

private 
  def extract_locale_from_accept_language_header
     request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
