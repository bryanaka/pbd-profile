class ApplicationController < ActionController::Base
	protect_from_forgery

	private

	def current_user
		@current_user ||= User.find_by_eppn(session[:user_eppn]) if session[:user_eppn]
	end

	def current_user_has_role?(role)
		begin
			@current_user.has_role?(role)
		rescue NoMethodError
			false
		end
	end

	def current_user_roles
		@current_user.roles ||= current_user.roles
	end

	def permitted_params
		@permitted_params ||= PermittedParams.new(params, current_user)
	end
	
	def shib_user
		@shib_user ||= User.find_by_eppn(request.env[:HTTP_EPPN])
	end

	helper_method :current_user
	helper_method :current_user_has_role?

end
