class Bug < ActiveRecord::Base
	
	belongs_to :report
	
	validates_presence_of :report_id
	
	def current_status_label
		BugStatus.current_status_label(bug_status_id)
	end
	
	def current_status
		BugStatus.current_status(bug_status_id)
	end
	
	def email_bug
		logger.info "     TO: #{report.developer.email}"
		logger.info "SUBJECT: Bug: #{report.location} -- #{name}"
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
		bug_status_id == BugStatus::OPEN.id
	end
	
	def is_inprogress
		bug_status_id == BugStatus::INPROGRESS.id
	end
	
	def is_resolved
		bug_status_id == BugStatus::RESOLVED.id
	end
end
