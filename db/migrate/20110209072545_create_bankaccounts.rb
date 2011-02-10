class CreateBankaccounts < ActiveRecord::Migration
  def self.up
    create_table :bankaccounts do |t|
      t.string :name
      t.integer :company_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bankaccounts
  end
end
