require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ProductsHelper. For example:
#

RSpec.describe ProductsHelper, type: :helper do
  describe '#category_selected?' do
    subject { helper.category_selected?(query, category_id) }
    let(:query) { { category_id_in: %w[1 2] } }
    let(:category_id) { 1 }

    context 'when given category is selected' do
      it 'returns true' do
        is_expected.to be_truthy
      end
    end

    context 'when given category is selected' do
      let(:category_id) { 3 }
      it 'returns false' do
        is_expected.to be_falsy
      end
    end
  end

  describe '#sort_option_list' do
    subject { helper.sort_option_list }
    let(:price_low_to_high) { 'price asc' }
    let(:price_low_to_high) { 'price desc' }
    let(:latest_product) { 'created_at desc' }

    context 'validates returned type' do
      it 'returns true' do
        is_expected.to be_a_kind_of(Array)
      end
    end

    context 'validates list options' do
      it 'confirms identical options' do
        is_expected.target.first.second.to be('')
        # is_expected.target.second.to be_identical_string(price_low_to_high)
        # is_expected.target.third.to be_identical_string(price_low_to_high)
        # is_expected.target.last.to be_identical_string(price_low_to_high)
      end
    end
  end
end
