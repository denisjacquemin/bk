class ChangePriceColumnsToCentsFormat < ActiveRecord::Migration
  def self.up
    # table bills
    remove_column :bills, :totaltvac
    add_column :bills, :totaltvac_in_cents, :integer, :null => false, :default => 0
    remove_column :bills, :totalhtva
    add_column :bills, :totalhtva_in_cents, :integer, :null => false, :default => 0
    
    # table products
    remove_column :products, :totaltvac
    add_column :products, :totaltvac_in_cents, :integer, :null => false, :default => 0 
    remove_column :products, :totalhtva
    add_column :products, :totalhtva_in_cents, :integer, :null => false, :default => 0
    remove_column :products, :unit_price
    add_column :products, :price_in_cents, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :bills, :totaltvac_in_cents
    remove_column :bills, :totalhtva_in_cents
    remove_column :products, :totaltvac_in_cents
    remove_column :products, :totalhtva_in_cents
    remove_column :products, :price_in_cents
    add_column :bills, :totaltvac, :float
    add_column :bills, :totalhtva, :float
    add_column :products, :totaltvac, :float
    add_column :products, :totalhtva, :float
    add_column :products, :unit_price, :float 
  end
end
