class CreateBills < ActiveRecord::Migration
  def self.up
    create_table :bills do |t|
      t.string :name
      t.string :reference
      t.date :effective_date
      t.integer :status_id
      t.integer :amount_tvac
      t.integer :customer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bills
  end
end
