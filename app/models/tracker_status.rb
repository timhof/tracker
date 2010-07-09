class TrackerStatus < TrackerEnumeration

	def self.findById(id)
		self.keys.find {|key| self[key].id == id}
	end
	
	def self.current_status_label(status)
		label = 'N/A'
		key = current_status(status)
		unless key.nil?
			 label = self[key].label
		end
		return label
	end
	
	def self.current_status(status)
		unless status.nil?
			 currentStatus = self.findById(status)
		end
		return currentStatus
	end
end
