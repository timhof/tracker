class DeveloperStatus < TrackerStatus
	
	self.add_item(:AVAILABLE, StatusValue.new(0, 'Available'))
	self.add_item(:INPROGRESS, StatusValue.new(1, 'In-Progress'))
	
end
