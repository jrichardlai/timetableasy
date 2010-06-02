class AddCursusIdToClassroom < ActiveRecord::Migration
  def self.up
    add_column :classrooms, :cursus_id, :integer
    remove_column :classrooms, :promotion_id
  end

  def self.down
    remove_column :classrooms, :cursus_id
    add_column :classrooms, :promotion_id, :integer
  end
end
