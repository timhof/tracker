class ReportStatus < TrackerStatus
	
	self.add_item(:PLANNING, StatusValue.new(0, 'Planning'))
	self.add_item(:INPROGRESS, StatusValue.new(1, 'In-Progress'))
	self.add_item(:TESTING_QHT, StatusValue.new(3, 'Testing QHT DEV'))
	self.add_item(:TESTING_L5M, StatusValue.new(5, 'Testing L5M DEV'))	
	self.add_item(:TESTING_PRO, StatusValue.new(4, 'Testing PRO'))	
	self.add_item(:STABLE, StatusValue.new(2, 'Stable'))	
	self.add_item(:CLOSED, StatusValue.new(6, 'Closed'))

end
