# frozen_string_literal: true

FactoryBot.define do
  factory :categories, class: 'Category' do
    trait :multiple_categories do
      3.times do |i|
        name { "category#{i}" }
      end
    end

    trait :one_category do
      name { 'category_1' }
      association :product, factory: :products
    end
  end
end
