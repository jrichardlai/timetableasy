class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string     :name
      t.datetime   :begin_at, :end_at
      t.boolean    :force_display, :default => false
      t.references :speaker
      t.string     :speaker_name
      t.references :location
      t.string     :location_name
      t.references :event_scope, :polymorphic => true #scoping for cursuses, campuses, classes, users, periods and promotions
      t.references :academical, :polymorphic => true #for educations and evaluations
      t.text       :description
      t.timestamps
    end

  end

  def self.down
    drop_table :events
  end
end
