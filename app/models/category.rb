class Category < ApplicationRecord
  has_many :products

  scope :filter_by_category, ->(category) { where name: category }
end
