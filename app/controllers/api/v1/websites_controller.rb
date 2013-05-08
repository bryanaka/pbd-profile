module Api
	module V1
		class WebsitesController < ApplicationController
			respond_to :json

			# GET api/v1/scientist/:id/websites/
			# returns JSON list of websites for scientist_id
			def index
				@websites = ScientistWebsite.find_all_by_scientist_id(params[:scientist_id])
				# rails 4 removes dynamic finders
				# @websites = ScientistWebsite.find_by scientist_id: params[:scientist_id]
				render :json => @websites, :each_serializer => WebsiteSerializer
			end
			# GET api/v1/scientist/:id/websites/:id
			# returns JSON with nested profile, titles, websites
			def show
				@websites = ScientistWebsite.find(params[:id])
				render :json => @websites, :serializer => WebsiteSerializer
			end
			# POST api/v1/scientist/:id/websites
			def create
				respond_with ScientistWebsite.create(permitted_params.website)
			end
			# PATCH/PUT api/v1/scientist/:id/websites/:id
			def update
				@scientist = ScientistWebsite.find(params[:id])
				if @scientist.update_attributes!(permitted_params.website)
					render :json => @scientists
				end
			end
			# DELETE api/v1/scientist/:id/websites/:id
			def destroy
				respond_with ScientistWebsite.destroy(params[:id])
			end
			# GET /api/v1/websites/all
			# Maybe not so REST
			def show_all
				@websites = ScientistWebsite.all
				render :json => @websites, :each_serializer => WebsiteSerializer
			end
		
		end
	end
end

