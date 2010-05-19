class CreateSchoolSubjects < ActiveRecord::Migration
  def self.up
    create_table :school_subjects do |t|
      t.string :name
      t.integer :cursus_id
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :school_subjects
  end
end
