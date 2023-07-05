# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

  # Seed Categories data
  category_response = JSON.parse(RestClient.get("https://fakestoreapi.com/products/categories"))
  category_response.each do |category|
    Category.create!(name: category)
  end

  # image download helper
  def download_image(image_url)
    image_source = URI.parse(image_url)
    filename = File.basename(image_source.path)

    # TODO: this is a security vulnerability
    file = URI.open(image_source)
    [file, filename]
  end

  # Seed Products Data
  product_response = JSON.parse(RestClient.get('https://fakestoreapi.com/products'))
  product_response.each do |product|
    product_var = Product.create!(
      name: product['title'],
      description: product['description'],
      stock: product['rating']['count'],
      price: product['price'],
      discount: rand(10..20),
      category_id: Category.find_by(name: product['category']).id
    )
    product_images = download_image(product['image'])
    product_var.images.attach(io: product_images.first, filename: product_images.last)
    product_var.category.photo.attach(product_var.primary_image.blob) unless product_var.category.photo.attached?
  end
end
