class Race < ApplicationRecord
  has_one :category
  has_many :race_events, dependent: :destroy
  has_many :events, through: :race_events
end
