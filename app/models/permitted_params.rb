class PermittedParams < Struct.new(:params, :user)
	
	# need to abstract out the params

	def scientist
		scientist_params = [:first_name, :last_name, :picture, :title, :slug]
		params.require(:scientist).permit(*scientist_params)
	end
	
	def profile
		scientist_profile_params = [:address1, :address2, :city, :company, 
																:department, :department_url, :email, :emphasis, 
																:location, :phone1, :phone2, :phone2_type, 
																:positions_held, :prefix, :state, 
																:summary, :zip_code]	
		params.require(:scientist_profile).permit(*scientist_profile_params)
	end

	def website
		scientist_website_params = [:name, :url, :description]
		params.require(:scientist_website).permit(*scientist_website_params)
	end

	def title
		params.require(:scientist_title).permit(:title, :order)
	end

	def scientist_full
		scientist_params = [:first_name, :last_name, :picture, :title, :slug]
		profile_params = [:address1, :address2, :city, :company, 
											:department, :department_url, :email, :emphasis, 
											:location, :phone1, :phone2, :phone2_type, 
											:positions_held, :prefix, :state, 
											:summary, :zip_code]
		website_params = [:name, :url, :description]	
		params.require(:scientist).permit( *scientist_params, profile_attributes: profile_params, websites_attributes: website_params, titles_attrbutes: [:title, :order])
	end

	# have to use this name to avoid conflicts
	def user_permit
		params.require(:user).permit(:mail, :name, :picture)
	end

end