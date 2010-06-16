class Bug < ActiveRecord::Base
	
	belongs_to :bug_status
	belongs_to :report
	
	def current_status
		return bug_status.status
	end
	
	def email_bug
		logger.info "     TO: #{report.developer.email}"
		logger.info "SUBJECT: Bug: #{name}"
		logger.info "   BODY: #{description}"
	end
	
	def self.email_bugs
		reports = Report.find(:all)
		reports.each do |report|
			report.email_bug
		end
	end
	
	def description_html
		return BlueCloth.new(description).to_html()
	end
	
	def notes_html
		return BlueCloth.new(notes).to_html()
	end
	
	def is_open
		bug_status.id == 1
	end
	
	def is_inprogress
		bug_status.id == 2
	end
	
	def is_resolved
		bug_status.id == 3
	end
end
