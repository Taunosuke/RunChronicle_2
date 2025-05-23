class CreateRaceResults < ActiveRecord::Migration[7.2]
  def change
    create_table :race_results do |t|
      t.integer :record_time_in_seconds
      t.text :impression
      t.references :user, null: false, foreign_key: true
      t.references :race, null: false, foreign_key: true

      t.timestamps
    end
  end
end
