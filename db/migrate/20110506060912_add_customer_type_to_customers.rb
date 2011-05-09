class AddCustomerTypeToCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :customer_type, :integer, :default => 1
  end

  def self.down
    remove_column :customers, :customer_type
  end
end
