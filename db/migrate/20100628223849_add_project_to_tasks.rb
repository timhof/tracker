class AddProjectToTasks < ActiveRecord::Migration
  def self.up
  	add_column :tasks, :project, :string
  end

  def self.down
  	remove_column :tasks, :project
  end
end
