class Journal < ActiveRecord::Base
	has_many :subscriptions, :dependent => :destroy
	has_many :subscribers, :through => :subscriptions
	

	
	before_save :load_defaults
	accepts_nested_attributes_for :subscriptions, :allow_destroy => true
	def to_s
		self.title
	end



	def load_defaults
		self.status ||= 'Ongoing'
		
	end


end
