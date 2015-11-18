class JournalsController < ApplicationController
	before_action :find_journal, only: [:show, :edit, :update, :destroy]
	before_action :require_permission
	before_action :authenticate_user!, except: [:index, :show]
	before_filter :require_permission, only: [:edit, :update, :destroy]
	
	def index
		if params[:journal_category].blank?
			@journals = Journal.all.order("created_at DESC")
		else
			@category_id = JournalCategory.find_by(name: params[:journal_category]).id
			@journals = Journal.where(journal_category_id: @category_id).order("created_at DESC")
		end
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
		@journal = current_user.journals.find(params[:id])
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
			params.require(:journal).permit(:title, :description, :journal_image, :journal_category_id)
		end

		def require_permission
			if current_user != Journal.find(params[:id]).user
				redirect_to root_path
			end
		end
end
