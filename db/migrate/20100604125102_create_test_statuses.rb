class CreateTestStatuses < ActiveRecord::Migration
  def self.up
    create_table :test_statuses do |t|
	  t.string :status
	  t.integer :rank
      t.timestamps
    end
  end

  def self.down
    drop_table :test_statuses
  end
end
