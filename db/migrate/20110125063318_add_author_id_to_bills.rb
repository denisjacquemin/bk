class AddAuthorIdToBills < ActiveRecord::Migration
  def self.up
    add_column :bills, :author_id, :integer
  end

  def self.down
    remove_column :bills, :author_id
  end
end
