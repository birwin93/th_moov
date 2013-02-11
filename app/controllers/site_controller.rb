class SiteController < ApplicationController
  include OrganizationSessionsHelper
  layout 'launch'

  skip_before_filter :load_user_loops

  def landing
  	if signed_in?
  		redirect_to current_user
  	end

    if org_signed_in?
      redirect_to current_org
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
