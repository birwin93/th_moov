class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include EventsHelper

  before_filter :parse_facebook_cookies
  before_filter :load_user_loops
  before_filter :store_urls
  before_filter :get_location

  def get_location

    if Rails.env.development?
      @city = "Ann Arbor, MI"
    else
      @city = "Ann Arbor, MI" #{request.location.city}, #{request.state_code}"
    end
  
  end

  def parse_facebook_cookies
    @facebook_cookies ||= Koala::Facebook::OAuth.new.get_user_info_from_cookie(cookies)
    if signed_in?
      @graph = Koala::Facebook::API.new(current_user.oauth_token)
      @link = @graph.get_picture(current_user.uid, type: "large")
    end
	end

	def load_user_loops 
    if signed_in?
		  @loops = current_user.loops
    end
	end

  def store_urls
    session[:previous_url] = session[:current_url] if session[:current_url]
    session[:current_url] = request.fullpath
  end
end
