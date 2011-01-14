class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :firstname
      t.string :lastname
      t.integer :address_id
      t.date :birthdate
      t.string :email
      t.text :comment
      t.integer :gender_id
      t.integer :nationality_id
      t.integer :title_id

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
