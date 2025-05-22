class AddUniqueIndexToRaceResults < ActiveRecord::Migration[7.2]
  def change
    remove_index :race_results, :race_id if index_exists?(:race_results, :race_id)
    add_index :race_results, :race_id, unique: true
  end
end
