class SubscribersController < ApplicationController
	def index
		@subscribers = Subscriber.all

		render(:template => "subscribers/index")
	end

	def show
		@subscriber = Subscriber.find(params[:id])
		@journal = Journal.all
	end

	def new
		@subscriber = Subscriber.new

		@journal = Journal.all

		render(:template => "subscribers/new")
	end

	def create

		@journal = Journal.all
		@subscriber = Subscriber.new(subscriber_params)

		if @subscriber.save
			redirect_to subscriber_path(@subscriber)

		else
			render(:template => "subscribers/new")
			
		end

		
	end


	def edit
		@subscriber = Subscriber.find(params[:id])

		render(:template => "subscribers/edit")
	end


	def update
		@subscriber = Subscriber.find(params[:id])

		if @subscriber.update(subscriber_params)
			redirect_to subscriber_path(@subscriber)

		else



		render(:template => "subscribers/edit")
	end
	end


	def destroy
		@subscriber = Subscriber.find(params[:id])
		@subscriber.destroy

		redirect_to subscribers_path
	end

	def subscriber_params
    	params.require(:subscriber).permit!
    	#telling params to require to get a key called :subscriber
    	# .permit = to be accepted by the server
    	# a security mechanism
	end
end