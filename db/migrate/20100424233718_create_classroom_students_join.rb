class CreateClassroomStudentsJoin < ActiveRecord::Migration
  def self.up
    create_table :classrooms_students do |t|
       t.references :user
       t.references :classroom
    end 
  end

  def self.down
    drop_table :classrooms_students
  end
end
