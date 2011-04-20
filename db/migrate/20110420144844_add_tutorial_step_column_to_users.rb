class AddTutorialStepColumnToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :tutorial_step, :integer, :default => 0
  end

  def self.down
    remove_column :users, :tutorial_step
  end
end
