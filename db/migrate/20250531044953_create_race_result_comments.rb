class CreateRaceResultComments < ActiveRecord::Migration[7.2]
  def change
    create_table :race_result_comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :race_result, null: false, foreign_key: true
      t.string :content
    end
  end
end
