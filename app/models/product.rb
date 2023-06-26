class Product < ApplicationRecord
  has_many_attached :images
  has_many :reviews
  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def download_image(image_url)
    image_source = URI.parse(image_url)
    filename = File.basename(image_source.path)

    # TODO: this is a security vulnerability
    file = URI.open(image_source)
    images.attach(io: file, filename: filename)
  end
end
