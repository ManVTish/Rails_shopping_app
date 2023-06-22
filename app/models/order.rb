class Order < ApplicationRecord
  has_many :items, as: :itemable
end
