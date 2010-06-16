class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
	  t.string :name
	  t.integer :description_id
	  t.integer :qht_nav_id
	  t.integer :l5m_nav_id
	  t.integer :jtrac_id
	  t.integer :report_status_id
	  t.integer :export_status_id
	  t.integer :spec_status_id
	  t.integer :test_status_id
	  t.integer :developer_id
	  t.text :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :reports
  end
end
