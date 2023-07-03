# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

  # Seed Categories data
  cat_res = JSON.parse(RestClient.get("https://fakestoreapi.com/products/categories"))
  cat_res.each do |cat|
    Category.create!(name: cat)
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
  pro_res = JSON.parse(RestClient.get('https://fakestoreapi.com/products'))
  pro_res.each do |p|
    product = Product.create!(
      name: p['title'],
      description: p['description'],
      stock: p['rating']['count'],
      price: p['price'],
      discount: rand * 20,
      category_id: case p['category']
                   when 'electronics'
                     1
                   when 'jewelery'
                     2
                   when "men's clothing"
                     3
                   else
                     4
                   end
    )
    product_images = download_image(p['image'])
    product.images.attach(io: product_images.first, filename: product_images.last)
  end
end
