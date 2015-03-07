class Journal < ActiveRecord::Base
	has_and_belongs_to_many :subscribers

	def to_s
		self.name
	end
end
