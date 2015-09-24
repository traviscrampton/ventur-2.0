class JournalsController < ApplicationController
	def index
		@journals = Journal.all.order("created_at DESC")
	end

	def new
		@journal = Journal.new
	end

	def create
		@journal = Journal.new(journal_params)
		if @journal.save
			redirect_to @journal
		else
			render 'new'
		end
	end

	def show
		@journal = Journal.find(params[:id])
	end

	private

		def journal_params
			params.require(:journal).permit(:title, :description)
		end
end
