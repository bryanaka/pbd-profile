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
				#respond_with Scientist.update(params[:id], full_scientist_params)
				@scientist = Scientist.includes(:profile, :titles, :websites).find(params[:id])
				authorize! :edit, @scientist
				@scientist.update_attributes!(permitted_params.scientist_full)
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

			private
			
			def full_scientist_params
				#scientist_params = [:first_name, :last_name, :picture, :title, :slug]
				profile_params =   [:id, :address1, :address2, :city, :company]
				profile_params.push(:department, :department_url, :email, :emphasis)
				profile_params.push(:location, :phone1, :phone2, :phone2_type)
				profile_params.push(:positions_held, :prefix, :state, :summary, :zip_code)
				website_params = [:name, :url, :description]
				params.require(:scientist).permit(:first_name, :last_name, :title, profile: profile_params, websites_attributes: website_params, titles_attrbutes: [:title, :order])
			end
		
		end
	end
end

