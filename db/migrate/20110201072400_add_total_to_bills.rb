class AddTotalToBills < ActiveRecord::Migration
  def self.up
    add_column :bills, :totaltvac, :float
    add_column :bills, :totalhtva, :float
    remove_column :bills, :total_tvac
  end

  def self.down
    add_column :bills, :total_tvac, :integer
    remove_column :bills, :totalhtva
    remove_column :bills, :totaltvac
  end
end
