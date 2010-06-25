class Issue < ActiveRecord::Base
	
	belongs_to :originator, :foreign_key => "originator_id", :class_name => "Developer"
	belongs_to :owner, :foreign_key => "owner_id", :class_name => "Developer"
	
	def current_status
		return IssueStatus.current_status_label(issue_status_id)
	end
	
	def description_html
		return BlueCloth.new(description).to_html()
	end
	
	def notes_html
		return BlueCloth.new(notes).to_html()
	end
end
