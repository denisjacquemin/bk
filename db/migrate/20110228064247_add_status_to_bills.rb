class AddStatusToBills < ActiveRecord::Migration
  def self.up
    add_column :bills, :status, :integer, :default => 0
  end

  def self.down
    remove_column :bills, :status
  end
end
