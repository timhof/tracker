class ExportStatus < TrackerStatus
	
	self.add_item(:NA, StatusValue.new(1, 'N/A'))
	self.add_item(:NOT_TESTED, StatusValue.new(2, 'Not Tested'))
	self.add_item(:INCOMPLETE, StatusValue.new(3, 'Incomplete'))
	self.add_item(:COMPLETE, StatusValue.new(4, 'Complete'))
	self.add_item(:NO_EXPORT, StatusValue.new(5, 'Incomplete'))
	
end
