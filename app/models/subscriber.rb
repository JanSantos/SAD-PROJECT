class Subscriber < ActiveRecord::Base

	SUBSCRIPTION_TYPE = ['Global Institutional', 'Global Individual', 'Local Institutional', 'Local Individual']

	validates :name, :presence => true
	validates :subscription_type, :presence => true
	validates :phone_details, :presence => true
	validates :first_address, :presence => true
	
	
	has_many :subscriptions, :dependent => :destroy
	has_many :journals, :through => :subscriptions

	accepts_nested_attributes_for :subscriptions, :allow_destroy => true

	def to_s
		self.name
	end


	def total_amount_due
		self.subscriptions.sum(:amount_due)
	end

end
