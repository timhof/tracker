class AddReportRankToDevelopers < ActiveRecord::Migration
  def self.up
  	add_column :developers, :report_rank, :integer
  end

  def self.down
  	remove_column :developers, :report_rank
  end
end
