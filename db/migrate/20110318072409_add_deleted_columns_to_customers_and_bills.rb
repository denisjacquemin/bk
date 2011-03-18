class AddDeletedColumnsToCustomersAndBills < ActiveRecord::Migration
  def self.up
    add_column :bills, :deleted, :boolean, :default => false
    add_column :customers, :deleted, :boolean, :default => false
  end

  def self.down
    remove_column :bills, :deleted
    remove_column :customers, :deleted
  end
end
