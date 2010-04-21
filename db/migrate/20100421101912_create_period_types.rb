class CreatePeriodTypes < ActiveRecord::Migration
  def self.up
    create_table :period_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :period_types
  end
end
