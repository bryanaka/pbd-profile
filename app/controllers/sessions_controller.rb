class SessionsController < ApplicationController
	
	def create
		# Get Shibboleth Data, then digest it.
		# finally, find the user based on shib data
		@shibuser = User.new
		digest_shib_data(@shibuser)
		user = User.find_by_eppn(@shibuser.eppn)
		
		# check to see if there is a profile, confirm if yes.
		profile_exists?(user)

		# Handle the different states of a user account: 
		# Exists and confirmed, 
		# Exists and not confirmed,
		# or doesn't exist
		if user && user.confirmed == true
			session[:user_eppn] = user.eppn
			redirect_to portal_path, :notice => "You have been sucessfully logged in"
		elsif user && user.confirmed == false
			redirect_to root_url, :notice => "You are still on the waiting list to be confirmed. If 2 business days have passed, please contact pbdwebmaster@lbl.gov"
		else
			user = User.new(*@shibuser)
			profile_exists?(user)
			if user.confirmed == nil
				user.confirmed = false
				user.save!
			end
			redirect_to root_url, :notice => "You have been placed in the waiting list to be confirmed. If you are not confirmed in 2 business days, please contact pbdwebmaster@lbl.gov"
		end
	end

	def destroy
		session[:user_eppn] = nil
		redirect_to root_url, :notice => "You have been logged out of PBD Portal"
	end

	private

	def digest_shib_data(user)
		user.name 	= request.env["HTTP_CN"]
		user.email 	= request.env["HTTP_MAIL"]
		user.eppn 	= request.env["HTTP_EPPN"]
		raise Exception.new("Shibboleth Data Was not processed correctly") unless user.eppn 
		user
	end

	def profile_exists?(user)
		profile = ScientistProfile.find_by_email(user.email)
		if profile && profile.scientist
			user.confirmed = true
			user.save!
		end
	end
end
