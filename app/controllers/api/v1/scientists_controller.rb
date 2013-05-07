module Api
	module V1
		class ScientistsController < ApplicationController
			respond_to :json

			def index
				@scientists = Scientist.all
				@scientists.sort! do |a,b|
					a.last_name.downcase <=> b.last_name.downcase
				end
				render :json => @scientists, :each_serializer => ScientistListSerializer
			end
		
			def show
				@scientist = Scientist.find(params[:id])
				render :json => @scientist
			end
		
			def edit
		
			end
		
			def new
		
			end
		
			def create
		
			end
		
			def update
		
		
			end
		
			def destroy
		
			end
		
		end
	end
end

