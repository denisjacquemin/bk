class AddTotalToBills < ActiveRecord::Migration
  def self.up
    add_column :bills, :totaltvac, :integer
    add_column :bills, :totalhtva, :integer
    remove_column :bills, :amount_tvac
    remove_column :bills, :total_tvac
  end

  def self.down
    add_column :bills, :total_tvac, :integer
    add_column :bills, :amount_tvac, :integer
    remove_column :bills, :totalhtva
    remove_column :bills, :totaltvac
  end
end
