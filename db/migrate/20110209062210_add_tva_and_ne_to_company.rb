class AddTvaAndNeToCompany < ActiveRecord::Migration
  def self.up
    add_column :companies, :tva_number, :string
    add_column :companies, :enreg_number, :string
  end

  def self.down
    remove_column :companies, :enreg_number
    remove_column :companies, :tva_number
  end
end
