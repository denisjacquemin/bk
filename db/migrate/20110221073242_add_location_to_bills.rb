class AddLocationToBills < ActiveRecord::Migration
  def self.up
    add_column :bills, :location, :string
  end

  def self.down
    remove_column :bills, :location
  end
end
