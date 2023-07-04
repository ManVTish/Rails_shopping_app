require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ProductsHelper. For example:
#

RSpec.describe ProductsHelper, type: :helper do
  describe ProductsHelper do
    describe 'category params' do
      it 'checks inclusion of category id' do
        expect(helper.category_selected?({ category_id_in: %w[1 2] }, 1)).to eq(true)
      end

      it 'checks exclusion of category id' do
        expect(helper.category_selected?({ category_id_in: %w[1 2] }, 3)).to eq(false)
      end
    end
  end

  describe ProductsHelper do
    describe 'sorting params' do
      it 'checks type returned' do
        expect(helper.sort_option_list.is_a?(Array)).to eq(true)
      end

      it 'selects Price low to high option' do
        expect(helper.sort_option_list.second.second).to match('price asc')
      end
    end
  end
end
