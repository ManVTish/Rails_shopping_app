class Cart < ApplicationRecord
  has_many :items, as: :itemable
end
