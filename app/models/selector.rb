class Selector
		attr_accessor :selectedColumns, 
					  :tier2IdNameMap, 
					  :selectedTier2, 
					  :maintainerIdNameMap, 
					  :selectedMaintainer,
					  :bugStatusIdNameMap,
					  :selectedBugStatuses,
					  :reportStatusIdNameMap,
					  :selectedReportStatus
					  
					  
	def initialize
		initialize_columns
		initialize_report_filters
		initialize_report_statuses
		initialize_bug_statuses
	end
	
	def initialize_columns
		@selectedColumns = {:options => '1',
						:name => '0',
						:package => '1',
						:category => '1',
						:program => '1',
						:nav_key => '1',
						:maintainer => '1',
						:status => '0',
						:test_status => '0',
						:export_status => '0',
						:specs_status => '0',
						:usage_status => '0',
						:open_bugs => '0',
						:inprogress_bugs => '0',
						:resolved_bugs => '0',
						:jtrac => '1',
						:date_updated => '0'}
	end
	
	def initialize_report_filters(select_all=true)
		
		if select_all
			@selectedMaintainer = {}
			@selectedTier2 = {}
		end
		
		tempMaintainerIdNameMap = {}
		tier_1_2_hash = {}
		
		Report.find(:all).each do |report| 
			
			tempMaintainerIdNameMap[report.developer_id] = report.developer.full_name
			nav_tier_1_2 = "#{report.navigation.tier_1}_#{report.navigation.tier_2}"
			tier_1_2_hash[nav_tier_1_2] = "#{report.navigation.package}_#{report.navigation.category}"
			
			if select_all
				@selectedMaintainer[report.developer_id] = '1'
				@selectedTier2[nav_tier_1_2] = '1'
			end
		end
		
		@maintainerIdNameMap = tempMaintainerIdNameMap.sort
		@tier2IdNameMap = tier_1_2_hash.sort
		
	end
	
	
	def initialize_bug_statuses
		
		@selectedBugStatuses = []
		tempBugStatusIdNameMap = {}
  		BugStatus.find(:all, :order => "rank asc").each do |bug_status|
  			@selectedBugStatuses << bug_status.id
  			tempBugStatusIdNameMap[bug_status.id] = bug_status.status
  		end
  		@bugStatusIdNameMap = tempBugStatusIdNameMap.sort
	end
	
	def initialize_report_statuses
		
		@selectedReportStatus = {}
		tempReportStatusIdNameMap = {}
  		ReportStatus.find(:all, :order => "rank asc").each do |report_status|
  			@selectedReportStatus[report_status.id] = '1'
  			tempReportStatusIdNameMap[report_status.id] = report_status.status
  		end
  		@reportStatusIdNameMap = tempReportStatusIdNameMap.sort
	end
	
	def confirm_report_data
		initialize_report_filters(false)
	end

end
