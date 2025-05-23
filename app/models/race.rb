class Race < ApplicationRecord
  has_one :category
  has_one :race_result, dependent: :destroy
  has_one :race_event, dependent: :destroy
  has_one :event, through: :race_event
end
