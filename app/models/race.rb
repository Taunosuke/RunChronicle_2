class Race < ApplicationRecord
  has_one :race_event, dependent: :destroy
  has_one :event, through: :race_event
end
