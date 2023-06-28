class Product < ApplicationRecord
  has_many_attached :images do |attachable|
    attachable.variant :default, strip: true, quality: 70, resize_to_fill: [200, 200]
  end
  has_many :reviews
  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
