class SpecsStatus < TrackerStatus
	
	self.add_item(:NA, StatusValue.new(0, 'N/A'))
	self.add_item(:NOT_TESTED, StatusValue.new(1, 'Not Tested'))
	self.add_item(:INCOMPLETE, StatusValue.new(2, 'Incomplete'))
	self.add_item(:COMPLETE, StatusValue.new(3, 'Complete'))
	
end
