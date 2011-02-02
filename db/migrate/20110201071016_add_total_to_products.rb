class AddTotalToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :totaltvac, :float
    add_column :products, :totalhtva, :float
  end

  def self.down
    remove_column :products, :totalhtva
    remove_column :products, :totaltvac
  end
end
