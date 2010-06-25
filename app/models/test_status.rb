class TestStatus < TrackerStatus
	
	self.add_item(:NO_TESTS, StatusValue.new(0, 'No Tests'))
	self.add_item(:NOT_TESTED, StatusValue.new(1, 'Not Tested'))
	self.add_item(:INCOMPLETE, StatusValue.new(2, 'Incomplete'))
	self.add_item(:HAS_FAILING_TESTS, StatusValue.new(3, 'Has Failing Tests'))
	self.add_item(:COMPLETE, StatusValue.new(4, 'Complete'))
	
end

