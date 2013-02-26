class VideosController < ApplicationController
	# GET /videos
	# GET /videos.json
	def index
		@videos = Video.all
	end

	# GET /videos/1
	def show
		@video = Video.find(params[:id])
	end

	# GET /videos/new
	def new
		@video = Video.new
	end

	# GET /videos/1/edit
	def edit
		@video = Video.find(params[:id])
	end

	# POST /videos
	def create
		@video = Video.new(video_params)
		if @video.save
			redirect_to @video, :notice => 'Video was successfully created.'
		else
			render :action => "new"
		end
	end

	# PATCH/PUT /videos/1
	def update
		@video = Video.find(params[:id])
		if @video.update_attributes(video_params)
			redirect_to @video, :notice => 'Video was successfully updated.'
		else
			render :action => "edit"
		end
	end

	# DELETE /videos/1
	def destroy
		@video = Video.find(params[:id])
		@video.destroy
		redirect_to videos_url
	end

	# POST /videos/batch_destroy
	# delete many videos
	def batch_destroy
		Video.destroy(params[:delete])
	end

	private

		# Use this method to whitelist the permissible parameters. Example:
		# params.require(:person).permit(:name, :age)
		# Also, you can specialize this method with per-user checking of permissible attributes.
		def video_params
			params.require(:video).permit()
		end
end
