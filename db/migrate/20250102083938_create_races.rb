class CreateRaces < ActiveRecord::Migration[7.2]
  def change
    create_table :races do |t|
      t.string :name
      t.date :date
      t.date :payment_due_date

      t.timestamps
    end
  end
end
