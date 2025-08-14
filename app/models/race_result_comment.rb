class RaceResultComment < ApplicationRecord
  belongs_to :race_result
  belongs_to :user
end
