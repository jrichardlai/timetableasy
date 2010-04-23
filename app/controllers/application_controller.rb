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
    if params[:locale]
      session[:locale] = params[:locale]
      I18n.locale = session[:locale]
      logger.debug "* LOCALE IS MANNUALY SET ON '#{I18n.locale}' SESSION IS '#{session[:locale]}"
    end
    if I18n.locale.nil?
      session[:locale] = extract_locale_from_accept_language_header
      logger.debug "* LOCALE IS AUTOMATICALY SET ON '#{I18n.locale}'"
    end
    logger.debug "* LOCALE IS '#{I18n.locale}' SESSION IS '#{session[:locale]}'"
    I18n.locale = session[:locale]
  end

  def current_page_path(options={})
    url_for( {:controller => self.controller_name, :action => self.action_name}.merge(options) )
  end
  helper_method :current_page_path

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
