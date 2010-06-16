class CreateUsageStatuses < ActiveRecord::Migration
  def self.up
    create_table :usage_statuses do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :usage_statuses
  end
end
