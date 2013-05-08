module Api
	module V1
		class VideosController < ApplicationController
			respond_to :json
			# GET /videos
			def index
				@videos = Video.all
				render :json => @videos
			end
		
			# GET /videos/1
			def show
				@video = Video.find(params[:id])
				render :json => @video
			end
		
			# POST /videos
			def create
				respond_with Video.create(video_params)
			end
		
			# PATCH/PUT /videos/1
			def update
				@video = Video.find(params[:id])
				if @video.update_attributes(video_params)
					render :json => @video
				end
			end
		
			# DELETE /videos/1
			def destroy
				respond_with Video.destroy(params[:id])
			end
		
			# POST /videos/batch_destroy
			# delete many videos
			def batch_destroy
				Video.destroy(params[:ids])
			end
		
			private
				# Use this method to whitelist the permissible parameters. Example:
				# params.require(:person).permit(:name, :age)
				# Also, you can specialize this method with per-user checking of permissible attributes.
				def video_params
					params.require(:video).permit()
				end

		end
	end
end
