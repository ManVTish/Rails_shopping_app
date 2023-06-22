class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :comments, presence: true
  validates :ratings, presence: true
end
