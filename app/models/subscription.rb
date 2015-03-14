class Subscription < ActiveRecord::Base
	belongs_to :journal
	belongs_to :subscriber


	


	before_validation :load_defaults

	def load_defaults
		if subscriber.subscription_type == "Institutional"
			self.price = journal.institutional_price
		elsif subscriber.subscription_type == "Individual"
			self.price = journal.individual_price
		end

		
	end
end
