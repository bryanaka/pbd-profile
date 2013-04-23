class ScientistsController < ApplicationController

	load_and_authorize_resource

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

end
