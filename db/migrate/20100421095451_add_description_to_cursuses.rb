class AddDescriptionToCursuses < ActiveRecord::Migration
  def self.up
    add_column :cursuses, :description, :text
  end

  def self.down
    remove_column :cursuses, :description
  end
end
