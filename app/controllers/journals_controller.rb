class JournalsController < ApplicationController
	def index
		@journals = Journal.all

		render(:template => "journals/index")
	end

	def show
		@journal = Journal.find(params[:id])
	end

	def new
		@journal = Journal.new

		render(:template => "journals/new")
	end

	def create
		@journal = Journal.new(journal_params)

		if @journal.save
			redirect_to journal_path(@journal)

		else
			render(:template => "journals/new")
			
		end

		
	end


	def edit
		@journal = Journal.find(params[:id])

		render(:template => "journals/edit")
	end


	def update
		@journal = Journal.find(params[:id])

		if @journal.update(journal_params)
			redirect_to journal_path(@journal)

		else



		render(:template => "journals/edit")
	end
	end


	def destroy
		@journal = Journal.find(params[:id])
		@journal.destroy

		redirect_to journals_path
	end

	def journal_params
    	params.require(:journal).permit!
    	#telling params to require to get a key called :journal
    	# .permit = to be accepted by the server
    	# a security mechanism
	end
end