class ApplicationController < ActionController::Base
	protect_from_forgery

private

	def permitted_params
		@permitted_params ||= PermittedParams.new(params, current_user)
	end

	def current_user
		@current_user ||= User.find_by_eppn(session[:user_eppn]) if session[:user_eppn]
	end
	
	helper_method :current_user
	
	def digest_shib_data
		shibuser 						= ShibUser.new
		shibuser.cn 				= request.env["HTTP_CN"]
		shibuser.email 			= request.env["HTTP_MAIL"]
		shibuser.eppn 			= request.env["HTTP_EPPN"]
		shibuser.given_name = request.env["HTTP_GIVENNAME"]
		shibuser.sn 				= request.env["HTTP_SN"]

		shibuser
	end

end
