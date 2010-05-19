class AddClassroomIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :classroom_id, :integer
    drop_table :classrooms_students
  end

  def self.down
    remove_column :users, :classroom_id
    create_table :classrooms_students do |t|
       t.references :user
       t.references :classroom
    end
  end
end
