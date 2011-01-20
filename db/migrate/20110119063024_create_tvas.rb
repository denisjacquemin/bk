class CreateTvas < ActiveRecord::Migration
  def self.up
    create_table :tvas do |t|
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :tvas
  end
end
