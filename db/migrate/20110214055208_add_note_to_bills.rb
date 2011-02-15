class AddNoteToBills < ActiveRecord::Migration
  def self.up
    add_column :bills, :note, :text
  end

  def self.down
    remove_column :bills, :note
  end
end
