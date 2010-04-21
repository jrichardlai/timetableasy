class CreateCampusesCursusesJoin < ActiveRecord::Migration
  def self.up
    create_table 'campuses_cursuses', :id => false do |t|
      t.column 'campus_id', :integer
      t.column 'cursus_id', :integer
    end
  end

  def self.down
    drop_table 'campuses_cursuses'
  end
end
