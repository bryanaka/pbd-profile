module Api
	module V1
		class ScientistsController < ApplicationController
			respond_to :json

			# GET api/v1/scientist, returns JSON list
			def index
				@scientists = Scientist.order("last_name").all
				render :json => @scientists, :each_serializer => ScientistListSerializer
			end
			# GET api/v1/scientist/:id, returns JSON with nested profile, titles, websites
			def show
				@scientist = Scientist.includes(:profile, :titles, :websites).find(params[:id])
				render :json => @scientist
			end
			# POST api/v1/scientist, 
			def create
				respond_with Scientist.create(permitted_params.scientist_full)
			end
			# PATCH/PUT api/v1/scientist/:id
			def update
				@scientist = Scientist.find(params[:id])
				authorize! :edit, @scientist
				@scientist.update_attributes(permitted_params.scientist_full)
				@scientist.save
				render :json => @scientist
			end
			# DELETE api/v1/scientist/:id
			def destroy
				respond_with Product.destroy(params[:id])
			end

			def show_by_slug
				@scientist = Scientist.find_by_slug(params[:slug])
				render :json => @scientist
			end
		
		end
	end
end

