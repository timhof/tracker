require 'test_helper'

class ReportTest < ActiveSupport::TestCase
 
	fixtures :bug_statuses, :bugs, :descriptions, :developers, :export_statuses, :j_tracs, :navigations, :report_statuses, :reports, :specs_statuses, :test_statuses, :usage_statuses
	
	def test_create_report
		report = Report.new
		assert !report.save
	end
	
	def test_full_report
		
		l5m_allocation_report = Report.new(:name => reports(:amt_allocation).name,
    :description => reports(:amt_allocation).description, :navigation => reports(:amt_allocation).navigation, :jtrac => reports(:amt_allocation).jtrac, :report_status => reports(:amt_allocation).report_status, :export_status => reports(:amt_allocation).export_status, :specs_status => reports(:amt_allocation).specs_status, :test_status => reports(:amt_allocation).test_status, :developer => reports(:amt_allocation).developer, :notes => reports(:amt_allocation).notes, :worker => reports(:amt_allocation).worker)
		 
		l5m_allocation_report.save
		
	end
	
end
