class SubscribersController < ApplicationController
	before_filter :authenticate_user!, except: [:index]
	before_filter :check_for_cancel, :only => [:create, :update]

	def index
		@subscribers = Subscriber.select("*")

			if !params[:q_name].blank?

	      @q_name = params[:q_name]

	      @subscribers = @subscribers.where("name LIKE ?", "%#{@q_name}%")


	        # Table name: contacts
	        # Paramters: first_name and last_name
	        
	      
	    end

	    if !params[:q_subscription_type].blank?
	      @q_subscription_type = params[:q_subscription_type]

	      @subscribers = @subscribers.where("subscription_type LIKE ?", "%#{@q_subscription_type}%")
	    end

	    if !params[:q_email_address].blank?
	      @q_email_address = params[:q_email_address]

	      @subscribers = @subscribers.where("email_address LIKE ?", "%#{@q_email_address}%")
	    end


		render(:template => "subscribers/index")
	end

	def show
		@subscriber = Subscriber.find(params[:id])
		@journal = Journal.all


		respond_to do |format|

		format.js
		format.pdf do
	      render pdf: @subscriber.name,
	             template: 'subscribers/show.pdf.erb',
	             locals: {:subscriber => @subscriber,},
	             show_as_html: params[:debug].present?
	             
	        end
	    end
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

	def check_for_cancel
		  if params[:commit] == "Cancel"
		  	    redirect_to subscribers_path
		  end

	end


end