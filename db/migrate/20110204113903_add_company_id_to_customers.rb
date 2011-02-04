class AddCompanyIdToCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :company_id, :integer
  end

  def self.down
    remove_column :customers, :company_id
  end
end
