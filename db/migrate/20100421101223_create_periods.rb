class CreatePeriods < ActiveRecord::Migration
  def self.up
    create_table :periods do |t|
      t.references :cursus
      t.references :period_type
      t.datetime :begin_at, :end_at
      t.timestamps
    end
  end

  def self.down
    drop_table :periods
  end
end
