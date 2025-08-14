class CreateRaceEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :race_events do |t|
      t.timestamps
    end
  end
end
