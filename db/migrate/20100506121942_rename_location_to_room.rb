class RenameLocationToRoom < ActiveRecord::Migration
  def self.up
    rename_column :events, :location_id, :room_id
    rename_column :events, :location_name, :room_name
  end

  def self.down
    rename_column :events, :room_id, :location_id
    rename_column :events, :room_name, :location_name
  end
end
