class Journal < ActiveRecord::Base

	default_scope { order(id: 'ASC')}
	
	has_many :subscriptions, :dependent => :destroy
	has_many :subscribers, :through => :subscriptions
	has_many :issues, :dependent => :destroy

	scope :enabled, -> {where(" status != 'Stopped'")}

	validates :title, :presence => true, :uniqueness => true
	validates :global_individual_price, :presence => true
	validates :global_institutional_price, :presence => true
	validates :local_individual_price, :presence => true
	validates :local_institutional_price, :presence => true
	validates :global_price_per_issue, :presence => true
	validates :local_price_per_issue, :presence => true

	before_save :load_defaults
	accepts_nested_attributes_for :subscriptions, :allow_destroy => true
	def to_s
		self.title
	end



	def load_defaults
		self.status ||= 'Ongoing'
		
	end


end
