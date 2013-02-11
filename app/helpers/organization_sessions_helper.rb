module OrganizationSessionsHelper
	def org_sign_in(object)
		cookies.permanent[:org_remember_token] = object.remember_token
		self.current_user = object
		cookies.delete(:remember_token)
	end

	def current_org=(org)
		@current_org = org
	end

	def current_org
		@current_org ||= Organization.find_by_remember_token(cookies[:org_remember_token])
	end

	def org_signed_in?
		!current_org.nil?
	end

	def org_sign_out
		self.current_org = nil
		cookies.delete(:org_remember_token)
	end

	def org_store_location
		session[:return_to] = request.url
	end

	def org_redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

end
