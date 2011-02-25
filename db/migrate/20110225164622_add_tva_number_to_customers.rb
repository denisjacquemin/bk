class AddTvaNumberToCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :tva_number, :string
  end

  def self.down
    remove_column :customers, :tva_number
  end
end
