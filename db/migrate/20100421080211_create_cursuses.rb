class CreateCursuses < ActiveRecord::Migration
  def self.up
    create_table :cursuses do |t|
      
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :cursuses
  end
end
