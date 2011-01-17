class AddLanguageIdToCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers, :language_id, :integer
  end

  def self.down
    remove_column :customers, :language_id
  end
end
