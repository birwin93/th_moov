class SiteController < ApplicationController

  layout 'launch'

  skip_before_filter :load_user_loops

  def landing
  	if signed_in?
  		redirect_to current_user
  	end

    @city = request.location.city
  end

  def about
  end

  def contact
  end

  def help
  end
end
