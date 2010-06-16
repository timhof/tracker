class AddWorkerToReports < ActiveRecord::Migration
  def self.up
  	add_column :reports, :worker, :string
  	add_column :reports, :usage_status_id, :integer
  end

  def self.down
  	remove_column :reports, :worker
  	remove_column :reports, :usage_status_id
  end
end
