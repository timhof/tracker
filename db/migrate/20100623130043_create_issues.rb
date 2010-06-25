class CreateIssues < ActiveRecord::Migration
  def self.up
    create_table :issues do |t|
	  t.string :description
	  t.integer :originator_id
	  t.integer :owner_id
	  t.integer :issue_status_id
	  t.text :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :issues
  end
end
