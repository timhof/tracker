class CreateExportStatuses < ActiveRecord::Migration
  def self.up
    create_table :export_statuses do |t|
	  t.string :status
	  t.integer :rank
      t.timestamps
    end
  end

  def self.down
    drop_table :export_statuses
  end
end
