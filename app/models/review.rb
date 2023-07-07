class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

  enum rating: { poor: 1, avg: 2, good: 3, very_good: 4, excellent: 5 }
end
