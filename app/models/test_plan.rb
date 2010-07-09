class TestPlan < ActiveRecord::Base
	
	belongs_to :report
	
	def plan_html
		return BlueCloth.new(plan).to_html()
	end
	
	def test_results_html
		return BlueCloth.new(test_results).to_html()
	end
end
