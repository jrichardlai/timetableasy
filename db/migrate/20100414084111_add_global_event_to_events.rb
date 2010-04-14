class AddGlobalEventToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :global_event, :boolean
    Event.update_all(:global_event => true)
  end

  def self.down
    remove_column :events, :global_event
  end
end
