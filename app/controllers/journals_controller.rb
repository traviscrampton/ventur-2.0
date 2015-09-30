class JournalsController < ApplicationController
	before_action :find_journal, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	
	def index
		@journals = Journal.all.order("created_at DESC")
	end

	def new
		@journal = current_user.journals.build
	end

	def create
		@journal = current_user.journals.build(journal_params)
		if @journal.save
			redirect_to @journal
		else
			render 'new'
		end
	end

	def show
		@journal = Journal.find(params[:id])
	end

	def edit
		@journal = Journal.find(params[:id])
	end

	def update
		if @journal.update journal_params
			redirect_to @journal
		else
			render 'edit'
		end
	end

	def destroy
		@journal = Journal.find(params[:id])
		@journal.destroy

		redirect_to root_path
	end

	private

		def find_journal 
			@journal = Journal.find(params[:id])
		end
				
		def journal_params
			params.require(:journal).permit(:title, :description)
		end
end
