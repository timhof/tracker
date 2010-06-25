class Navigation < ActiveRecord::Base
	validates_presence_of :tier_1, :tier_2, :tier_3
	validates_numericality_of :tier_1, :tier_2, :tier_3
end
