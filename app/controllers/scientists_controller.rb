class ScientistsController < ApplicationController
	
	def index
		@scientists = Scientist.all
	end

	def show
		@scientist = Scientist.find(params[:id])
	end

	def edit
		@scientist = Scientist.find(params[:id])
	end

	def new
		@scientist = Scientist.new
	end

	def create
	@scientist = Scientist.new(scientist_params)
		if @scientist.save
			redirect_to @scientist, notice: 'Scientist was successfully created.'
		else
			render action: "new"
		end
	end

	def update
		@scientist = Scientist.find(params[:id])
		if @scientist.update_attributes!(scientist_params)
			redirect_to @scientist, notice: 'Scientist was successfully updated.'
		else
			render action: "edit"
		end
	end

	def destory
		@person = Person.find(params[:id])
		@person.destroy
		redirect_to people_url
	end

	private
	# Use this method to whitelist the permissible parameters. Example:
	# params.require(:person).permit(:name, :age)
	# Also, you can specialize this method with per-user checking of permissible attributes.
	# 
	# 1. clean up the code using lists and the splat operater
	# 2. The nested attributes are a bit hard to understand. I think I did them wrong
	# 3. can we use cancan to alter which attributes can be modified? use cancan to alter the 
	# 	permit_X_attributes local variable
	# 
	

	def scientist_params
		permit_scientist_attributes = :first_name, :last_name, :picture, :title, :slug
		#permit_scientist_profile_attributes = :id, :address1, :address2, :city, :company, 
		#																			:department, :department_url, :email, :emphasis, 
		#																			:location, :phone1, :phone2, :phone2_type, 
		#																			:positions_held, :prefix, :scientist_id, :state, 
		#																			:summary, :zip_code
		params.require(:scientist).permit(*permit_scientist_attributes)
	end

end
