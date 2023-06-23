class Product < ApplicationRecord
  has_many :reviews
  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
