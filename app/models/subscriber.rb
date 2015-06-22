class Subscriber < ActiveRecord::Base

	default_scope { order(id: 'ASC')}


	SUBSCRIPTION_TYPE = ['Global Institutional', 'Global Individual', 'Local Institutional', 'Local Individual']

	validates :name, :presence => true
	validates :subscription_type, :presence => true, :uniqueness => {:scope=>:name}
	validates :phone_number, :presence => true
	validates :first_address, :presence => true
	validates :email_address, :presence => true
	
	scope :enabled, -> {where(" subscription.subscription_status != 'Unsubscribed'")}
	
	has_many :subscriptions, :dependent => :destroy
	has_many :journals, :through => :subscriptions

	accepts_nested_attributes_for :subscriptions, :allow_destroy => true


	before_save :load_defaults
	before_validation :load_defaults

	def to_s
		self.name
	end


	def total_amount_due
		self.subscriptions.sum(:amount_due)
	end


	def load_defaults
		
		
		self.contact_person ||= '--'

		self.ip_address ||= '--'
	end

end
