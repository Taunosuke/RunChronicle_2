class AddTimestampsToRaceResultComments < ActiveRecord::Migration[7.2]
  def change
    add_timestamps :race_result_comments, null: true
  end
end
