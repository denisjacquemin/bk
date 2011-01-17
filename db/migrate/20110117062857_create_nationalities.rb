class CreateNationalities < ActiveRecord::Migration
  def self.up
    create_table :nationalities do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end

  def self.down
    drop_table :nationalities
  end
end
