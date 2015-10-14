class GearItemsController < ApplicationController
before_action :set_gear_list
before_action :set_gear_item, except: [:create]

	def create
		@gear_item = @gear_list.gear_items.create(gear_item_params)

		redirect_to @gear_list
	end

	def destroy
		if @gear_item.destroy
			redirect_to @gear_list
		end
	end

	private

		def set_gear_list
			@gear_list = GearList.find(params[:gear_list_id])
		end

		def set_gear_item
			@gear_item = @gear_list.gear_items.find(params[:id])
		end

		def gear_item_params
			params[:gear_item].permit(:item_name)
		end
end
