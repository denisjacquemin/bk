class AddPhoneToCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers, :phone, :string
  end

  def self.down
    remove_column :customers, :phone
  end
end
