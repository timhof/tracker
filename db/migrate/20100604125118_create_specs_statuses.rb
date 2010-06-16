class CreateSpecsStatuses < ActiveRecord::Migration
  def self.up
    create_table :specs_statuses do |t|
	  t.string :status
	  t.integer :rank
      t.timestamps
    end
  end

  def self.down
    drop_table :specs_statuses
  end
end
