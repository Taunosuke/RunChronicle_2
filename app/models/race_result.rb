class RaceResult < ApplicationRecord
  belongs_to :user
  belongs_to :race
  has_one :race_events
end
