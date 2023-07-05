require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'checks show page working' do
    let(:product) { create(:product) }
    let(:category) { product.category }

    it 'renders show page' do
      get '/products', params: { products: { id: product.id } }
      expect(response).to have_http_status(:success)
      # expect(response).to render_template(:show)
    end
  end

  describe 'checks index page working' do
    let(:category) { create_list(:category, 3) }
    let(:product1) { create_list(:product, 4, category_id: category.second.id) }
    let(:product2) { create_list(:product, 3, category_id: category.third.id) }
    let(:product3) { create_list(:product, 1, category_id: category.first.id) }

    it 'renders index page' do
      get '/products'
      expect(response).to have_http_status(:success)
      # expect(response).to render_template(:index)
    end

    it 'renders sorted index page' do
      @products = [product1, product2, product3].flatten
      get '/products', params: {
        query: {
          category_id_in: ['1'],
          price_gteq: '2',
          price_lteq: '',
          s: 'price asc'
        }
      }

      expect(@products.count).to match(8)
      expect(@products.select { |x| x[:category_id] == 2 }.count).to match(1)
      expect(@products.select { |x| x[:price] >= 2 }.present?).to match(true)
    end
  end
end
