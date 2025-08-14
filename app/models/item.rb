class Item < ApplicationRecord
  belongs_to :user
  has_many :race_items, dependent: :destroy
  has_many :races, through: :race_items
end
