class CreateRaceItems < ActiveRecord::Migration[7.2]
  def change
    create_table :race_items do |t|
      t.references :race
      t.references :item, null: false, foreign_key: true
      t.integer :check
      t.timestamps
    end
  end
end
