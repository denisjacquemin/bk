class AddSortActiveAndCompanyIdToTvas < ActiveRecord::Migration
  def self.up
    add_column :tvas, :sort, :integer
    add_column :tvas, :active, :integer, :default => 1
    add_column :tvas, :company_id, :integer, :default => 0
  end

  def self.down
    remove_column :tvas, :company_id
    remove_column :tvas, :active
    remove_column :tvas, :sort
  end
end
