require 'pp'
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
				@scientist = Scientist.includes(:profile, :titles, :websites).find(params[:id])
				#authorize! :edit, @scientist
				pp params
				@scientist.update_attributes!(scientist_params)
				@scientist.profile.update_attributes!(profile_params)
				@scientist.titles.each do |title|
					old_title = ScientistTitles.find(title.id)
					old_title.title = title.title
					old_title.order = title.order
					old_title.save!
				end
				# update attributes for each title and website
				# loop through ids found on @scientist and find them, update them
				# if not found, create a new title or website 

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
			# Not Working yet for nested params
			#
			# def full_scientist_params
			# 	#scientist_params = [:first_name, :last_name, :picture, :title, :slug]
			# 	profile_params =   [:id, :address1, :address2, :city, :company]
			# 	profile_params.push(:department, :department_url, :email, :emphasis)
			# 	profile_params.push(:location, :phone1, :phone2, :phone2_type)
			# 	profile_params.push(:positions_held, :prefix, :state, :summary, :zip_code, :_destory)
			# 	website_params = [:id, :name, :url, :description, :_destory]
			# 	params.require(:scientist).permit(:first_name, :last_name, :title, profile: profile_params, websites_attributes: website_params, titles_attrbutes: [:title, :order])
			# end
			def scientist_params
				scientist_params = [:first_name, :last_name, :picture, :title, :slug]
				params.require(:scientist).permit(*scientist_params)
			end

			def profile_params
				profile_params =   [:id, :address1, :address2, :city, :company]
				profile_params.push(:department, :department_url, :email, :emphasis)
				profile_params.push(:location, :phone1, :phone2, :phone2_type)
				profile_params.push(:positions_held, :prefix, :state, :summary, :zip_code, :_destory)
				params.require(:profile).permit(*profile_params)
			end

			def website_parmas
				website_params = [:id, :name, :url, :description, :_destory]
				params.require(:websites).permit(*website_params)
			end

			def title_params
				title_params = [:title, :order]
				params.require(:titles).permit(*title_params)
			end
		
		end
	end
end

