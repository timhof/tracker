class Report < ActiveRecord::Base

	belongs_to :developer
	belongs_to :navigation, :dependent => :destroy
	belongs_to :jtrac, :class_name => "JTrac"
	belongs_to :description, :dependent => :destroy
	has_many :bugs, :dependent => :destroy
	has_many :test_plans, :dependent => :destroy
	has_many :tasks
	has_attached_file :manual, :default_url => ""	
	
	accepts_nested_attributes_for :jtrac, :navigation, :description

	validates_presence_of :name
	
	def location
		return "#{navigation.package} | #{navigation.category} | #{navigation.program}"
	end
	
	def package
		return navigation.package
	end
	
	def category
		return navigation.category
	end
	
	def nav_key
		tier_1 = "%02d" % navigation.tier_1
		tier_2 = "%02d" % navigation.tier_2
		tier_3 = "%02d" % navigation.tier_3
		return "#{tier_1}_#{tier_2}_#{tier_3}_0"
	end
	
	def nav_tier_2
		return "#{navigation.tier_1}_#{navigation.tier_2}"
	end
	
	def program
		return navigation.program
	end
	
	def maintainer
		return developer.full_name
	end
	
	def current_status
		return ReportStatus.current_status(report_status_id)
	end
	def current_status_label
		return ReportStatus.current_status_label(report_status_id)
	end
	
	def testability
		return TestStatus.current_status_label(test_status_id)
	end
	
	def exportability
		return ExportStatus.current_status_label(export_status_id)
	end
	
	def spec_profiles
		return SpecsStatus.current_status_label(spec_status_id)
	end
	
	def jtrac_code
		unless jtrac.nil?
			return jtrac.code
		end
	end
	
	def jtrac_url
		unless jtrac.nil?
			return jtrac.url
		end
	end
	
	def user_usage
		UsageStatus.current_status_label(usage_status_id)
	end
	
	def objective_html
		return BlueCloth.new(description.objective).to_html()
	end
	
	def usage_html
		return BlueCloth.new(description.usage).to_html()
	end
	
	def notes_html
		logger.info notes
		logger.info BlueCloth.new(notes).to_html()
		return BlueCloth.new(notes).to_html()
	end
	
	def open_bugs
		open_bugs = []
		bugs.each do |bug|
			if bug.current_status == BugStatus::OPEN
				open_bugs << bug
			end
		end
		return open_bugs
	end
	
	def inprogress_bugs
		inprogress_bugs = []
		bugs.each do |bug|
			if bug.current_status == BugStatus::INPROGRESS
				inprogress_bugs << bug
			end
		end
		return inprogress_bugs
	end
	
	def resolved_bugs
		resolved_bugs = []
		bugs.each do |bug|
			if bug.current_status == BugStatus::RESOLVED
				resolved_bugs << bug
			end
		end
		return resolved_bugs
	end
	
	def num_unresolved_bugs
		return open_bugs.size + inprogress_bugs.size
	end
	
	def has_unresolved_bugs?
		return num_unresolved_bugs > 0
	end
	
	def self.all_reports_by_location
		return Report.find(:all).sort do |report1, report2|
			report1.location <=> report2.location
		end
	end
end
