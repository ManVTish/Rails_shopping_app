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

    it 'should render show' do
      get '/products/1'
      expect(response).to have_http_status(:success)
    end

    it 'should render index' do
      get '/products'
      expect(response).to have_http_status(:success)
    end
  end

  context 'products sorting' do
    let(:categories) { create(:categories) }

    it 'should render index page' do
      get '/products', params: {
        query: {
          'category_id_in' => ['0'],
          'price_gteq' => '50',
          'price_lteq' => '',
          's' => 'price asc'
        }
      }
      expect(categories.count).to match(3)
      expect(categories.first.products.count).to match(5)
      expect(categories.first.products.first.primary_image.count).to match(0)
    end
  end
end
