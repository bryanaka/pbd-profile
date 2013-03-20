class SessionsController < ApplicationController
	
	def create
		@shibuser = User.new
		digest_shib_data(@shibuser)

		user = User.find_by_eppn(@shibuser.eppn)
		if user && user.confirmed == true
			session[:user_eppn] = shibuser.eppn
			redirect_to portal_path, :notice => "You have been sucessfully logged in"
		elsif user && user.confirmed == false
			redirect_to root_url, :notice => "You are still on the waiting list to be confirmed. If 2 business days have passed, please contact pbdwebmaster@lbl.gov"
		else
			user = User.new(@shibuser)
			user.confirmed = false
			user.save!
			redirect_to root_url, :notice => "You have been placed in the waiting list to be confirmed. If you are not confirmed in 2 business days, please contact pbdwebmaster@lbl.gov"
		end
	end

	def destroy
		session[:user_eppn] = nil
		redirect_to root_url, :notice => "You have been logged out of PBD Portal"
	end

	private

	def digest_shib_data(user)
		user.name 		= request.env["HTTP_CN"]
		user.email 		= request.env["HTTP_MAIL"]
		user.eppn 		= request.env["HTTP_EPPN"]
		user
	end
end
