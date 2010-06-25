class IssueStatus < TrackerStatus
	
	self.add_item(:OPEN, StatusValue.new(0, 'Open'))
	self.add_item(:WORKING, StatusValue.new(1, 'In-Progress'))
	self.add_item(:WAITING_RESPONSE, StatusValue.new(1, 'Waiting Response'))
	self.add_item(:RESOLVED, StatusValue.new(3, 'Resolved'))
	
end
