class ScientistController < ApplicationController
  
  def index
		@scientists = Scientist.all
	end

	def show
		@scientist = Scientist.find(params[:id])
	end

	def edit
		@scientist = Scientist.find(params[:id])
	end

	def new
		
	end

	def create
		
	end

	def update
		scientist = Scientist.find(params[:id])
    scientist.update_attributes!(scientist_params)
    redirect_to scientist
	end

	private

	def scientist_params
		params.require(:scientist).permit(:first_name, :last_name, :picture, :title, :slug)
	end

end
