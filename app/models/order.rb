class Order < ApplicationRecord
  has_many :items, as: :itemable
  has_many :comments, as: :commentable
  belongs_to :user

  validates :status, presence: true

  enum status: {placed: 0, dispatched: 1, transit: 2, delivered: 3}
end
