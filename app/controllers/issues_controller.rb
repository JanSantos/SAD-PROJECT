class IssuesController < ApplicationController
	def index
		@issues = Issue.all

		render(:template => "journals/index")
	end

	def show
		@issue = Issue.find(params[:id])
		
	end

	def new
		
		@issue = Issue.new
		@journal = Journal.find(params[:journal_id])
		

		render(:template => "issues/new")
	end

	def create

		
		@issue = Issue.new(issue_params)
		@journal = Journal.find(params[:journal_id])
		@issue.journal = @journal	
		if @issue.save
			redirect_to journals_path(@issue)

		else
			render(:template => "issues/new")
			
		end

		
	end


	def edit
		@issue = Issue.find(params[:id])

		render(:template => "issues/edit")
	end


	def update
		@issue = Issue.find(params[:id])

		if @issue.update(issue_params)
			redirect_to issue_path(@issue)

		else



		render(:template => "issues/edit")
	end
	end


	def destroy
		@issue = Issue.find(params[:id])
		@issue.destroy

		redirect_to issues_path
	end

	def issue_params
    	params.require(:issue).permit!
    	#telling params to require to get a key called :issue
    	# .permit = to be accepted by the server
    	# a security mechanism
	end
end