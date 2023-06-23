class Review < ApplicationRecord
  has_many :comments, as: :commentable
  belongs_to :product
  belongs_to :user

  validates :rating, presence: true

  enum rating: {poor: 1, average: 2, good: 3, very_good: 4, excellent: 5}
end
