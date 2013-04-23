class ApplicationController < ActionController::Base
	protect_from_forgery

	private

	def permitted_params
		@permitted_params ||= PermittedParams.new(params, current_user)
	end

	def current_user
		@current_user ||= User.find_by_eppn(session[:user_eppn]) if session[:user_eppn]
	end

	def shib_user
		@shib_user ||= User.find_by_eppn(request.env[:HTTP_EPPN])
	end

	helper_method :current_user

end
