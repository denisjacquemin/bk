class AddSexIdColumnToCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers, :sex_id, :integer
  end

  def self.down
    remove_column :customers, :sex_id
  end
end
