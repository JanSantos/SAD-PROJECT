class SubscriptionsController < ApplicationController
	def index
		@subscriptions = Subscription.all

		render(:template => "subscribers/index")
	end

	def show
		@subscription = Subscription.find(params[:id])
		@subscriber = Subscriber.find(params[:subscriber_id])
		@journal = Journal.all


	end

	def new
		@subscription = Subscription.new
		@subscriber = Subscriber.find(params[:subscriber_id])
		@journal = Journal.all


		render(:template => "subscriptions/new")
	end

	def create

		@journal = Journal.all
		@subscription = Subscription.new(subscription_params)
		@subscriber = Subscriber.find(params[:subscriber_id])
		@subscription.subscriber = @subscriber	
		if @subscription.save 
			redirect_to subscribers_path(@subscription)

		else
			render(:template => "subscriptions/new")
			
		end

		
	end


	def edit
		@subscription = Subscription.find(params[:id])

		render(:template => "subscriptions/edit")
	end


	def update
		@subscription = Subscription.find(params[:id])

		if @subscription.update(subscription_params)
			redirect_to subscription_path(@subscription)

		else



		render(:template => "subscriptions/edit")
	end
	end


	def destroy
		@subscription = Subscription.find(params[:id])
		@subscription.destroy

		redirect_to subscriptions_path
	end

	def subscription_params
    	params.require(:subscription).permit!
    	#telling params to require to get a key called :subscription
    	# .permit = to be accepted by the server
    	# a security mechanism
	end



	def paid
		@subscriber = Subscriber.find(params[:subscriber_id])
		@subscription = Subscription.find(params[:subscription_id])

		
		@subscription.update(:payment_status => "Paid")
		@subscription.update(:amount_due => 0 )

		redirect_to subscriber_path(@subscriber.id)
	end


	def unpaid
		@subscriber = Subscriber.find(params[:subscriber_id])
		@subscription = Subscription.find(params[:subscription_id])

		@amount_due = @subscription.years_of_subscription * @subscription.price
		
		@subscription.update(payment_status: "Unpaid", :amount_due => @amount_due)
		@subscription.update(:amount_due => @amount_due )

		redirect_to subscriber_path(@subscriber.id)
	end

	def delivered
		@subscriber = Subscriber.find(params[:subscriber_id])
		@subscription = Subscription.find(params[:subscription_id])

		
		@subscription.update(delivery_status: "Delivered")

		redirect_to subscriber_path(@subscriber.id)
	end


	def undelivered
		@subscriber = Subscriber.find(params[:subscriber_id])
		@subscription = Subscription.find(params[:subscription_id])

		
		@subscription.update(delivery_status: "Undelivered")

		redirect_to subscriber_path(@subscriber.id)
	end

	def subscribed
		@subscriber = Subscriber.find(params[:subscriber_id])
		@subscription = Subscription.find(params[:subscription_id])

		
		@subscription.update(subscription_status: "Subscribed")

		redirect_to subscriber_path(@subscriber.id)
	end


	def unsubscribed
		@subscriber = Subscriber.find(params[:subscriber_id])
		@subscription = Subscription.find(params[:subscription_id])

		
		@subscription.update(subscription_status: "Unsubscribed")

		redirect_to subscriber_path(@subscriber.id)
	end

end