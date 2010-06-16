class CreateBugs < ActiveRecord::Migration
  def self.up
    create_table :bugs do |t|
	  t.string :description
	  t.integer :report_id
	  t.integer :bug_status_id
	  t.text :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :bugs
  end
end
