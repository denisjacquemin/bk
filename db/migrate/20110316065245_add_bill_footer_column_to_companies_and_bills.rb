class AddBillFooterColumnToCompaniesAndBills < ActiveRecord::Migration
  def self.up
    add_column :companies, :bill_footer, :text
  end

  def self.down
    remove_column :companies, :bill_footer
  end
end
