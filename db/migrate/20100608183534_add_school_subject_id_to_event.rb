class AddSchoolSubjectIdToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :school_subject_id, :integer
    add_column :events, :teaching_method_id, :integer
    remove_column :events, :academical_id
    remove_column :events, :academical_type
  end

  def self.down
    remove_column :events, :teaching_method_id
    remove_column :events, :school_subject_id
  end
end
