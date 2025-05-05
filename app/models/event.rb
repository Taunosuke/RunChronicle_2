class Event < ApplicationRecord
  has_many :race_events
  has_many :races, through: :race_events
end
