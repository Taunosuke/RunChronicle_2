class Item < ApplicationRecord
  has_many :race_items, dependent: :destroy
end
