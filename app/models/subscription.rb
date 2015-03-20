class Subscription < ActiveRecord::Base
	belongs_to :journal
	belongs_to :subscriber

	validates :subscriber_id, :uniqueness => {:scope=>:journal_id}
	validates :journal_id, :presence => true

	before_save :load_defaults
	before_validation :load_defaults

	def load_defaults
		if subscriber.subscription_type == "Global Institutional"
			self.price = journal.global_institutional_price
		elsif subscriber.subscription_type == "Global Individual"
			self.price = journal.global_individual_price
		elsif subscriber.subscription_type == "Local Institutional"
			self.price = journal.global_individual_price
		elsif subscriber.subscription_type == "Local Individual"
			self.price = journal.global_individual_price
		end

		self.payment_status ||= 'Unpaid'
		self.delivery_status ||= 'Undelivered'
		self.subscription_status ||= 'Unsubscribed'



	end



end
