class CreateTeachingMethods < ActiveRecord::Migration
  def self.up
    create_table :teaching_methods do |t|
      t.string :teaching_type
      t.integer :duration
      t.integer :school_subject_id

      t.timestamps
    end
  end

  def self.down
    drop_table :teaching_methods
  end
end
