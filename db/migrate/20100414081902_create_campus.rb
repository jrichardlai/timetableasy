class CreateCampus < ActiveRecord::Migration
  def self.up
    create_table :campus do |t|
      t.string :name
      t.text :address
      t.string :city
      t.string :zip
      t.string :country
      t.string :timezone
      t.timestamps
    end
  end

  def self.down
    drop_table :campus
  end
end
