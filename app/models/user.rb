class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :races, dependent: :destroy
  has_many :race_result_comments, dependent: :destroy
end
