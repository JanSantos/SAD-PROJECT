class Journal < ActiveRecord::Base
	has_many :subscriptions
	has_many :subscribers, :through => :subscriptions
	
	accepts_nested_attributes_for :subscriptions, :allow_destroy => true
	def to_s
		self.name
	end
end
