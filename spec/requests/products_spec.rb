require 'rails_helper'

RSpec.describe 'Products', type: :request do
  context 'checks index and show working' do
    before(:each) do
      @category = Category.create(
        name: 'category_1'
      )
      @product = Product.create(
        name: 'product_1',
        description: 'description for product_1',
        price: 100,
        discount: 15,
        stock: 2,
        category_id: @category.id
      )
    end

    it 'renders show page' do
      get '/products/1'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end

    it 'renders index page' do
      get '/products'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  context 'products sorting' do
    before(:each) do
      @category1 = Category.create(
        name: 'category_1'
      )
      @category2 = Category.create(
        name: 'category_2'
      )
      @product1 = @category1.products.create(
        name: 'product_1',
        description: 'description for product_1',
        price: 101,
        discount: 15,
        stock: 1
      )
      @product2 = @category1.products.create(
        name: 'product_2',
        description: 'description for product_2',
        price: 102,
        discount: 15,
        stock: 2
      )
      @product3 = @category2.products.create(
        name: 'product_3',
        description: 'description for product_3',
        price: 103,
        discount: 15,
        stock: 3
      )
    end

    it 'renders index page' do
      get '/products', params: {
        query: {
          'category_id_in' => ['0'],
          'price_gteq' => '50',
          'price_lteq' => '',
          's' => 'price asc'
        }
      }
      expect(Category.all.count).to match(2)
      expect(Product.all.count).to match(3)
      expect(Product.first.primary_image).to match(nil)
      expect(response).to render_template(:index)
    end
  end
end
