class Schooling < ActiveRecord::Base
  set_table_name :classrooms_students
  belongs_to :user
  belongs_to :classroom
end
