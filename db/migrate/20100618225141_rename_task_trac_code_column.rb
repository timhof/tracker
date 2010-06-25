class RenameTaskTracCodeColumn < ActiveRecord::Migration
  def self.up
  	rename_column :tasks, :trac_code, :jtrac_code
  end

  def self.down
  	rename_column :tasks, :jtrac_code, :trac_code
  end
end
