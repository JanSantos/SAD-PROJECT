class Subscriber < ActiveRecord::Base

	SUBSCRIPTION_TYPE = ["Institutional", "Individual"]

	validates :name, :presence => true
	validates :subscription_type, presence: true, inclusion: { :in => SUBSCRIPTION_TYPE }
	has_and_belongs_to_many :journals, :class_name => 'Journal'

	def to_s
		self.name
	end
end
