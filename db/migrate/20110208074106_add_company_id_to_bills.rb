class AddCompanyIdToBills < ActiveRecord::Migration
  def self.up
    add_column :bills, :company_id, :integer
  end

  def self.down
    remove_column :bills, :company_id
  end
end
