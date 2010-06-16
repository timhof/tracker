class CreateBugStatuses < ActiveRecord::Migration
  def self.up
    create_table :bug_statuses do |t|
	  t.string :status
	  t.integer :rank
      t.timestamps
    end
  end

  def self.down
    drop_table :bug_statuses
  end
end
