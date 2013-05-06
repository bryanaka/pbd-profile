module Api
	module V1
		class ScientistsController < ApplicationController
			respond_to :json

			def index
				@scientists = Scientist.all
				render :json => @scientists, :each_serializer => ScientistListSerializer
			end
		
			def show
		
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

