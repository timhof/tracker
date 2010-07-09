class AddReportToTask < ActiveRecord::Migration
  def self.up
  	add_column :tasks, :report_id, :integer
  end

  def self.down
  	remove_column :tasks, :report_id
  end
end
