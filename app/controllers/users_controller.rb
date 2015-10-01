class UsersController < ApplicationController
	def show
	  @user = User.find(params[:id])
	end

	def find_journal
		@journals = Journal.find(params[:id])
	end
end
