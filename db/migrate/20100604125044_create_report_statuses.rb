class CreateReportStatuses < ActiveRecord::Migration
  def self.up
    create_table :report_statuses do |t|
	  t.string :status
	  t.integer :rank
      t.timestamps
    end
  end

  def self.down
    drop_table :report_statuses
  end
end
