class ScientistsController < ApplicationController

	def index
		@scientists = Scientist.all
		@scientists.sort! do |a,b|
			a.last_name.downcase <=> b.last_name.downcase
		end
	end

	def show
		@scientist = Scientist.find(params[:id])
		render :layout => "site_template"
	end

	def edit
		@scientist = Scientist.find(params[:id])
		if @scientist.profile == nil
			@scientist.build_profile
		end
	end

	def new
		@scientist = Scientist.new
		@scientist.build_scientist_profile
		# needs to be able to add many at a time
		@scientist.scientist_websites.build
		@scientist.scientist_titles.build
	end

	def create
	@scientist = Scientist.new(permitted_params.scientist_full)
		if @scientist.save
			redirect_to @scientist, notice: 'Scientist was successfully created.'
		else
			render action: "new"
		end
	end

	def update
		@scientist = Scientist.find(params[:id])
		if @scientist.update_attributes!(permitted_params.scientist_full)
			redirect_to @scientist, notice: 'Scientist was successfully updated.'
		else
			render action: "edit"
		end
	end

	def destroy
		@scientist = Scientist.find(params[:id])
		@scientist.destroy
		redirect_to scientist_index_path
	end
	private
	# Use this method to whitelist the permissible parameters. Example:
	# params.require(:person).permit(:name, :age)
	# Also, you can specialize this method with per-user checking of permissible attributes.
	#
	# 1. See permitted_params.rb
	#
	# 3. can we use cancan to alter which attributes can be modified? use cancan to alter the
	# 	permit_X_attributes local variable
	#


	# def scientist_params
	# 	permit_scientist_attributes = :first_name, :last_name, :picture, :title, :slug
	# 	permit_scientist_profile_attributes = :id, :address1, :address2, :city, :company,
	# 																				:department, :department_url, :email, :emphasis,
	# 																				:location, :phone1, :phone2, :phone2_type,
	# 																				:positions_held, :prefix, :scientist_id, :state,
	# 																				:summary, :zip_code
	# 	permit_scientist_websites_attributes = :name, :url, :descirption
	# 	params.require(:scientist).permit( *permit_scientist_attributes, scientist_profile_attributes: permit_scientist_profile_attributes, scientist_websites_attributes: permit_scientist_websites_attributes )
	# end
end
