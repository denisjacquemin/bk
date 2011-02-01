class AddTotalToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :totaltvac, :integer
    add_column :products, :totalhtva, :integer
  end

  def self.down
    remove_column :products, :totalhtva
    remove_column :products, :totaltvac
  end
end
