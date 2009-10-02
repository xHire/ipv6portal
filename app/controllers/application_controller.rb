# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  before_filter :www_address

  private
  def www_address
    if RAILS_ENV == 'production' && request.env['SERVER_NAME'] == 'ipv6portal.cz'
      redirect_to 'http://www.ipv6portal.cz' + request.env['PATH_INFO'], :status => :moved_permanently
    end
  end
end
