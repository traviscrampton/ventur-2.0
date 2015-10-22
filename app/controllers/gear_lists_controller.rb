class GearListsController < ApplicationController
before_action :set_gear_list, only: [:show, :edit, :update, :destroy]
before_filter :require_permission, only: [:edit, :destroy]

	def index
		@gear_lists = GearList.all
	end 

	def show
	end

	def new
		@gear_list = current_user.gear_lists.build
	end

	def edit
	end

	def update
	end

	def create
		@gear_list = current_user.gear_lists.build(gear_list_params)

		if @gear_list.save
			redirect_to @gear_list
		else
			render 'new'
		end
	end

	def destroy
		@gear_list.destroy
		redirect_to root_path
	end

	private

		def set_gear_list
			@gear_list = GearList.find(params[:id])
		end

		def gear_list_params
			params[:gear_list].permit(:title)
		end

		def require_permission
			if current_user != GearList.find(params[:id]).user
				redirect_to root_path
			end
		end
end
