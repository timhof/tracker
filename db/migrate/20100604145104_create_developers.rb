class CreateDevelopers < ActiveRecord::Migration
  def self.up
    create_table :developers do |t|
	  t.string :first
	  t.string :last
	  t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :developers
  end
end
