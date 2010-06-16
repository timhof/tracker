class CreateJTracs < ActiveRecord::Migration
  def self.up
    create_table :j_tracs do |t|
	  t.string :code
	  t.string :project
	  t.string :url
      t.timestamps
    end
  end

  def self.down
    drop_table :j_tracs
  end
end
