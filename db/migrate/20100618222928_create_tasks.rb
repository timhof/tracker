class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
	  t.string :name
	  t.text :description
	  t.text :notes
	  t.string :jtrac_url
	  t.string :trac_code
	  t.string :jtrac_project
	  t.integer :task_status_id
	  t.integer :developer_id
      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
