class AddNameToBugs < ActiveRecord::Migration
  def self.up
  	add_column :bugs, :name, :string
  end

  def self.down
  	remove_column :bugs, :name
  end
end
