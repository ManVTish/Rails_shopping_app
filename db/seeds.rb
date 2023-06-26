# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

  # Seed Categories data
  cat_res = JSON.parse(RestClient.get("https://fakestoreapi.com/products/categories"))
  cat_res.each do |cat|
    Category.create!(name: cat)
  end

  # Seed Products Data
  pro_res = JSON.parse(RestClient.get('https://fakestoreapi.com/products'))
  pro_res.each do |p|
    product = Product.create!(
      name: p['title'],
      description: p['description'],
      stock: p['rating']['count'],
      price: p['price'],
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
    product.download_image(p['image'])
  end
end
