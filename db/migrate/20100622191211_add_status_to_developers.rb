class AddStatusToDevelopers < ActiveRecord::Migration
  def self.up
  	add_column :developers, :status, :integer
  	add_column :developers, :status_description, :text
  end

  def self.down
  	remove_column :developers, :status
  	remove_column :developers, :status_description
  end
end
