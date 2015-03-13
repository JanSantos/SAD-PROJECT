class Subscriber < ActiveRecord::Base

	SUBSCRIPTION_TYPE = ["Institutional", "Individual"]

	validates :name, :presence => true
	validates :subscription_type, presence: true, inclusion: { :in => SUBSCRIPTION_TYPE }
	has_many :subscriptions
	has_many :journals, :through => :subscriptions

	accepts_nested_attributes_for :subscriptions, :allow_destroy => true

	def to_s
		self.name
	end
end
