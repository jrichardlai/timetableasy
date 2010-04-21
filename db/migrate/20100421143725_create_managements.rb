class CreateManagements < ActiveRecord::Migration
  def self.up
    create_table :managements do |t|
      t.references :user
      t.references :campus
      t.timestamps
    end
  end

  def self.down
    drop_table :managements
  end
end
