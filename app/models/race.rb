class Race < ApplicationRecord
  has_one :race_result, dependent: :destroy
  has_one :race_event, dependent: :destroy
  has_one :event, through: :race_event
  has_one :stay_plan, dependent: :destroy
  has_many :race_items, dependent: :destroy
  has_many :items, through: :race_items
  belongs_to :user
end
