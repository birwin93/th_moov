class OrganizationSessionsController < ApplicationController
	include OrganizationSessionsHelper
	skip_before_filter :load_user_loops
	
	def create
		org = Organization.find_by_name(params[:organization_session][:name])
		if org && org.authenticate(params[:organization_session][:password])
		org_sign_in org
			redirect_to org
		else
		 flash[:error] = "Invalid email/password combination"
		 redirect_to controller: 'site', action: 'landing'
		end
	end

	def destroy
		org_sign_out
		redirect_to root_url
	end
end
