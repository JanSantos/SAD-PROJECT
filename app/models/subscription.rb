class Subscription < ActiveRecord::Base
	belongs_to :journal
	belongs_to :subscriber

	YEARS_OF_SUBSCRIPTION = ['1', '2']

	validates :subscriber_id, :uniqueness => {:scope=>:journal_id, :message => 'Already Subscribed'}
	validates :journal_id, :presence => true
	validates :years_of_subscription, :presence => true

	scope :enabled, -> {where(" subscription_status != 'Unsubscribed'")}
	
	before_save :load_defaults, :set_expiration_date
	before_validation :load_defaults


	def set_expiration_date
        self.expiration_date =  Date.today + self.years_of_subscription.years
        
    end

	def load_defaults
		if subscriber.subscription_type == "Global Institutional"
			self.price = journal.global_institutional_price
		elsif subscriber.subscription_type == "Global Individual"
			self.price = journal.global_individual_price
		elsif subscriber.subscription_type == "Local Institutional"
			self.price = journal.local_institutional_price
		elsif subscriber.subscription_type == "Local Individual"
			self.price = journal.local_individual_price
		end

		self.payment_status ||= 'Unpaid'
		self.delivery_status ||= 'Undelivered'
		self.subscription_status ||= 'Subscribed'
		self.amount_due ||= self.years_of_subscription * self.price

	end

	def amount
		self.amount_due = self.years_of_subscription * self.price
	end

	def pays
		if self.payment_status = 'Paid'
			self.amount_due = 0
		end
	end

	def unpays
		if self.payment_status = 'Unpaid'
			self.amount_due = self.years_of_subscription * self.price
		end
	end

	def total
		sum( :amount_due)
	end


end
