class TaskStatus < TrackerStatus
	
	self.add_item(:PLANNING, StatusValue.new(0, 'Planning'))
	self.add_item(:QUEUED, StatusValue.new(1, 'Queued'))
	self.add_item(:INPROGRESS, StatusValue.new(2, 'In-Progress'))
	self.add_item(:COMPLETE, StatusValue.new(3, 'Complete'))
	
end

