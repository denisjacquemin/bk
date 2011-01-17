class AddReferenceToCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers, :reference, :string
  end

  def self.down
    remove_column :customers, :reference
  end
end
