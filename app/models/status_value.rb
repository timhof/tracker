class StatusValue
	
	include Comparable
	
	attr_accessor :id, :label
	
	def initialize(id, label)
		@id = id
		@label = label
	end
	
	def <=>(other)
		@id <=> other.id
	end
end