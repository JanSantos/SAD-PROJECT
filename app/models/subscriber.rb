class Subscriber < ActiveRecord::Base

	SUBSCRIPTION_TYPE = ['Individual', 'Institutional']

	validates :name, :presence => true
	
	has_many :subscriptions, :dependent => :destroy
	has_many :journals, :through => :subscriptions

	accepts_nested_attributes_for :subscriptions, :allow_destroy => true

	def to_s
		self.name
	end
end
