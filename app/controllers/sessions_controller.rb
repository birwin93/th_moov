class SessionsController < ApplicationController
	skip_before_filter :load_user_loops
	
	def create
		#user = User.find_by_email(params[:session][:email].downcase)
		#if user && urrser.authenticate(params[:session][:password])
		#	sign_in user
		#	redirect_back_or user
		#else
		#	flash[:error] = "Invalid email/password combination"
		#	redirect_to controller: 'site', action: 'landing'
			#render partial: '/shared/loginbox'
		#end
		user = User.from_omniauth(env["omniauth.auth"])
    cookies[:remember_token] = user.remember_token
    redirect_to root_url
	end

	def destroy
		sign_out
		redirect_to root_url
	end

end
