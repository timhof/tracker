class BugStatus < TrackerStatus
	
	self.add_item(:OPEN, StatusValue.new(0, 'Open'))
	self.add_item(:INPROGRESS, StatusValue.new(1, 'In-Progress'))
	self.add_item(:RESOLVED, StatusValue.new(3, 'Resolved'))
	
end
