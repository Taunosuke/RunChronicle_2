class RaceEvent < ApplicationRecord
  belongs_to :race
  belongs_to :event
end
