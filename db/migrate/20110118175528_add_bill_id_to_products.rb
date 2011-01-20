class AddBillIdToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :bill_id, :integer
  end

  def self.down
    remove_column :products, :bill_id
  end
end
