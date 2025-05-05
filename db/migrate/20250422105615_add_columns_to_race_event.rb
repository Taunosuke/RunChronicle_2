class AddColumnsToRaceEvent < ActiveRecord::Migration[7.2]
  def change
    add_reference :race_events, :race, null: false, foreign_key: true
    add_reference :race_events, :event, null: false, foreign_key: true
  end
    add_index :race_events, [:race_id, :events_id], unique: true
end
