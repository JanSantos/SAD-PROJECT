class Subscription < ActiveRecord::Base
	belongs_to :journal
	belongs_to :subscriber

	validates :subscriber_id, :uniqueness => {:scope=>:journal_id}

	before_save :load_defaults
	before_validation :load_defaults

	def load_defaults
		if subscriber.subscription_type == "Institutional"
			self.price = journal.institutional_price
		elsif subscriber.subscription_type == "Individual"
			self.price = journal.individual_price
		end

		self.payment_status ||= 'Unpaid'
		self.delivery_status ||= 'Undelivered'
		self.subscription_status ||= 'Unsubscribed'



	end



end
