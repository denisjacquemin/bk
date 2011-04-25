class RemoveUnusedColumnsInCustomers < ActiveRecord::Migration
  def self.up
    remove_column :customers, :birthdate
    remove_column :customers, :language_id
    remove_column :customers, :nationality_id
    remove_column :customers, :gender_id
  end

  def self.down
    add_column :customers, :birthdate, :date
    add_column :customers, :language_id, :integer
    add_column :customers, :nationality_id, :integer
    add_column :customers, :gender_id, :integer
  end
end
