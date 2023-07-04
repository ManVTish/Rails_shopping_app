# frozen_string_literal: true

FactoryBot.define do
  factory :products, class: 'Product' do
    trait :one_product do
      name { 'product_1' }
      stock { 4 }
      price { 100 }
      discount { rand * 10 }
      description { 'This is product description _ 1' }
      category
    end

    trait :multiple_products do
      5.times do |i|
        name { "product#{i}" }
        stock { i }
        price { i * 15 }
        discount { rand * i * 10 }
        description { "This is product description #{i}" }
        category
      end
    end
  end
end
