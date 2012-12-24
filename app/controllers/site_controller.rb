class SiteController < ApplicationController
  def landing
  	if signed_in?
  		redirect_to current_user
  	end
  end

  def about
  end

  def contact
  end

  def help
  end
end
