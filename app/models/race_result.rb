class RaceResult < ApplicationRecord
  belongs_to :user
  belongs_to :race, dependent: :destroy

  def formatted_time_japanese
    hours = record_time_in_seconds / 3600
    minutes = (record_time_in_seconds % 3600) / 60
    seconds = record_time_in_seconds % 60
    "#{hours}時間#{minutes}分#{seconds}秒"
  end
end
