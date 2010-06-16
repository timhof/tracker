class DropQhtNavColumn < ActiveRecord::Migration
  def self.up
  	remove_column :reports, :qht_nav_id
  	rename_column :reports, :l5m_nav_id, :navigation_id
  end

  def self.down
  	add_column :reports, :qht_nav_id, :integer
  	rename_column :reports, :navigation_id, :l5m_nav_id
  end
end
