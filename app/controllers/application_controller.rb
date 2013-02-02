class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :parse_facebook_cookies
  before_filter :load_user_loops
  before_filter :store_urls
  before_filter :get_location

  def get_location
    #unless current_user.ip_address
     # current_user.ip_address = request.ip
     # @city = ""
     # current_user.save!
    #else 
    #spot = request.ip
    @city = request.location.city
    #end
   
  end

  def parse_facebook_cookies
  	@facebook_cookies ||= Koala::Facebook::OAuth.new.get_user_info_from_cookie(cookies)
	end

	def load_user_loops 
		@loops = current_user.loops
	end

  def store_urls
    session[:previous_url] = session[:current_url] if session[:current_url]
    session[:current_url] = request.fullpath
  end
end
