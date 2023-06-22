class Order < ApplicationRecord
  has_many :items, as: :itemable
  belongs_to :user

  validates :status, presence: true
  validates :comment, presence: true
end
