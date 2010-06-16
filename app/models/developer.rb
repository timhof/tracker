class Developer < ActiveRecord::Base
	has_many :reports
	
	def full_name
		"#{first} #{last}"
	end
end
