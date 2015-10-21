class GearListsController < ApplicationController
before_action :set_gear_list, only: [:show, :edit, :update, :destroy]

	def index
		@gear_lists = GearList.all
	end 

	def show
	end

	def new
		@gear_list = GearList.new
	end

	def edit
	end

	def create
		@gear_list = GearList.new(gear_list_params)

		if @gear_list.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def destroy
		@gear_list.destroy
		render 'new'
	end

	private

		def set_gear_list
			@gear_list = GearList.find(params[:id])
		end

		def gear_list_params
			params[:gear_list].permit(:title)
		end
end
