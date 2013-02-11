module SessionsHelper
	def sign_in(object)
		cookies.permanent[:remember_token] = object.remember_token
		self.current_user = object
		cookies.delete(:organization_remember_token)
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		#if @current_user.class == User 
			@current_user ||= User.find_by_remember_token(cookies[:remember_token])
		#else 
		#	@current_user ||= Organization.find_by_remember_token(cookies[:remember_token])
		#end
	end

	def signed_in?
		!current_user.nil?
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end

	def store_location
		session[:return_to] = request.url
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

end
