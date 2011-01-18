class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.integer :unit_price
      t.integer :amount_tva

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
