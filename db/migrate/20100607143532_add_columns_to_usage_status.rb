class AddColumnsToUsageStatus < ActiveRecord::Migration
  def self.up
  	add_column :usage_statuses, :status, :string
  	add_column :usage_statuses, :rank, :integer
  end

  def self.down
  	remove_column :usage_statuses, :status
  	remove_column :usage_statuses, :rank
  end
end
