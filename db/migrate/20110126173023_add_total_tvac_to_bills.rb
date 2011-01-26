class AddTotalTvacToBills < ActiveRecord::Migration
  def self.up
    add_column :bills, :total_tvac, :integer
  end

  def self.down
    remove_column :bills, :total_tvac
  end
end
