class Order < ApplicationRecord
  has_many :items, as: :itemable
  belongs_to :user
end
