class CreateNavigations < ActiveRecord::Migration
  def self.up
    create_table :navigations do |t|
	  t.integer :tier_1
	  t.integer :tier_2
	  t.integer :tier_3
	  t.string :package
	  t.string :category
	  t.string :program
      t.timestamps
    end
  end

  def self.down
    drop_table :navigations
  end
end
