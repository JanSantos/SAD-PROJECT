class JournalsController < ApplicationController
	def index
		@journals = Journal.select("*")

			if !params[:q_title].blank?

	      @q_title = params[:q_title]

	      @journals = @journals.where("title LIKE ?", "%#{@q_title}%")

	  end
	        # Table name: contacts
	        # Paramters: first_name and last_name

		render(:template => "journals/index")
	end

	def show
		@journal = Journal.find(params[:id])
		
  

		respond_to do |format|

		format.js
		format.pdf do
	      render pdf: @journal.title,
	             template: 'journals/show.pdf.erb',
	             locals: {:journal => @journal},
	             show_as_html: params[:debug].present?
	           end  
	        end
	    
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

	def ongoing
		
		@journal = Journal.find(params[:journal_id])

		
		@journal.update(status: "Ongoing")

		redirect_to journals_path(@journal.id)
	end


	def stopped
		
		@journal = Journal.find(params[:journal_id])

		
		@journal.update(status: "Stopped")

		redirect_to journals_path(@journal.id)
	end
end