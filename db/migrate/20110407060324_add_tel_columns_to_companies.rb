class AddTelColumnsToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :tel, :string, :default => ''
    add_column :companies, :fax, :string, :default => ''
    add_column :companies, :gsm, :string, :default => ''
    add_column :companies, :email, :string, :default => ''
  end

  def self.down
    remove_column :companies, :email
    remove_column :companies, :gsm
    remove_column :companies, :fax
    remove_column :companies, :tel
  end
end
