class Cart < ApplicationRecord
  has_many :items, as: :itemable
  belongs_to :user
end
