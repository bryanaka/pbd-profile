module Api
	module V1
		class ScientistTitlesController < ApplicationController
			respond_to :json

			# GET api/v1/scientist/:id/titles/
			# returns JSON list of titles for scientist_id
			def index
				@titles = ScientistTitle.find_all_by_scientist_id(params[:scientist_id])
				# rails 4 removes dynamic finders
				# @titles = ScientistTitle.find_by scientist_id: params[:scientist_id]
				render :json => @titles
			end
			# GET api/v1/scientist/:id/titles/:id
			# returns JSON with nested profile, titles, websites
			def show
				@titles = ScientistTitle.find(params[:id])
				render :json => @titles
			end
			# POST api/v1/scientist/:id/titles
			def create
				respond_with ScientistTitle.create(permitted_params.title)
			end
			# PATCH/PUT api/v1/scientist/:id/titles/:id
			def update
				@title = ScientistTitle.find(params[:id])
				if @title.update_attributes!(permitted_params.title)
					render :json => @title
				end
			end
			# DELETE api/v1/scientist/:id/titles/:id
			def destroy
				respond_with ScientistTitle.destroy(params[:id])
			end
		
		end
	end
end

