class UsageStatus < TrackerStatus
	
	self.add_item(:NA, StatusValue.new(0, 'N/A'))
	self.add_item(:INCOMPLETE, StatusValue.new(1, 'Incomplete'))
	self.add_item(:COMPLETE, StatusValue.new(2, 'Complete'))
	
end

