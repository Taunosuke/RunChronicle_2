class CreateStayPlans < ActiveRecord::Migration[7.2]
  def change
    create_table :stay_plans do |t|
      t.references :race, null: false, foreign_key: true
      t.string :place_name
      t.string :address
      t.datetime :check_in_time
      t.datetime :check_out_time
      t.string :note

      t.timestamps
    end
  end
end
