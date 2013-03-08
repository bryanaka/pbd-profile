class SessionsController < ApplicationController
	
	def create
		shibuser = digest_shib_data
		user = User.find_by_eppn(shibuser.eppn)
		if user && user.confirmed == true
			session[:user_eppn] = shibuser.eppn
			redirect_to portal_path, :notice => "You have been sucessfully logged in"
		else
			user = User.new
			user.eppn = shibuser.eppn
			user.email = shibuser.mail
			user.name = shibuser.cn
			user.confirmed = false
			user.save!
			redirect_to root_url, :notice => "You have been placed in the waiting list to be confirmed. If you are not confirmed in 2 business days, please contact pbdwebmaster@lbl.gov"
		end
	end
	
	def destroy
		session[:user_eppn] = nil
		redirect_to root_url, :notice => "You have been logged out of PBD Portal"
	end
end
