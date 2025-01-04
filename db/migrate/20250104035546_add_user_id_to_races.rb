class AddUserIdToRaces < ActiveRecord::Migration[7.2]
  def change
    add_column :races, :user_id, :integer
  end
end
