class AddTvaIdToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :tva_id, :integer
  end

  def self.down
    remove_column :products, :tva_id
  end
end
