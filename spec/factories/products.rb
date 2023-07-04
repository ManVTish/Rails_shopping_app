# frozen_string_literal: true

FactoryBot.define do
  factory :product, class: 'Product' do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    price { Faker::Number.number(digits: 1) }
    stock { Faker::Number.number(digits: 2) }
    discount { Faker::Number.number(digits: 1) }
    association :category
  end
end
