class CreateCampuses < ActiveRecord::Migration
  def self.up
    create_table :campuses do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :campuses
  end
end
