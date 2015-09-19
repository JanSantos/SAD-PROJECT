namespace :abc do 
	desc "Update subscriptions status, checks for expired ones"



	task :update_subscription_status => :environment do 

		#code goes here

		subs = Subscription.all

		subs.each do |f|

			if f.expiration_date <= Date.today
				f.update(subscription_status: "Expired")
			end
		end

		puts "It worked yo"

		
	end

end