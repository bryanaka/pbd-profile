module Api
	module V1
		class ScientistsController < ApplicationController
			respond_to :json

			# GET api/v1/scientist, returns JSON list
			def index
				@scientists = Scientist.all
				@scientists.sort! do |a,b|
					a.last_name.downcase <=> b.last_name.downcase
				end
				render :json => @scientists, :each_serializer => ScientistListSerializer
			end
			# GET api/v1/scientist/:id, returns JSON with nested profile, titles, websites
			def show
				@scientist = Scientist.find(params[:id])
				render :json => @scientist
			end
			# POST api/v1/scientist, 
			def create
				respond_with Scientist.create(permitted_params.scientist_full)
			end
			# PATCH/PUT api/v1/scientist/:id
			def update
				@scientist = Scientist.find(params[:id])
				if @scientist.update_attributes!(permitted_params.scientist_full)
					render :json => @scientists
				end
			end
			# DELETE api/v1/scientist/:id
			def destroy
				respond_with Product.destroy(params[:id])
			end
		
		end
	end
end

