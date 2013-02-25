class PermittedParams < Struct.new(:params, :user)
	
	# need to abstract out the params

	def scientist
		scientist_params = [:first_name, :last_name, :picture, :title, :slug]
		params.require(:scientist).permit(*scientist_params)
	end
	
	def scientist_profile
		scientist_profile_params = [:address1, :address2, :city, :company, 
																:department, :department_url, :email, :emphasis, 
																:location, :phone1, :phone2, :phone2_type, 
																:positions_held, :prefix, :state, 
																:summary, :zip_code]	
		params.require(:scientist_profile).permit(*scientist_profile_params)
	end

	def scientist_website
		scientist_website_params = [:name, :url, :description]
		params.require(:scientist_website).permit(*scientist_website_params)
	end

	def scientist_titles
		params.require(:scientist_title).permit(:title)
	end

	def scientist_full
		scientist_params = [:first_name, :last_name, :picture, :title, :slug]
		scientist_profile_params = [:address1, :address2, :city, :company, 
																:department, :department_url, :email, :emphasis, 
																:location, :phone1, :phone2, :phone2_type, 
																:positions_held, :prefix, :state, 
																:summary, :zip_code]
		scientist_website_params = [:name, :url, :description]	
		params.require(:scientist).permit( *scientist_params, scientist_profile_attributes: scientist_profile_params, scientist_websites_attributes: scientist_website_params, scientist_titles_attrbutes: :title )
	end

end