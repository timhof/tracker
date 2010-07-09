class CreateTestPlans < ActiveRecord::Migration
  def self.up
    create_table :test_plans do |t|
      t.string :name
	  t.string :plan
	  t.string :environment
	  t.string :status
	  t.string :test_results
	  t.integer :report_id
	  t.integer :developer_id
      t.timestamps
    end
  end

  def self.down
    drop_table :test_plans
  end
end
