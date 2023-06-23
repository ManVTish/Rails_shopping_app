require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:status) }
  end

  describe 'Associations' do
    it { should have_many(:items) }
    it { should belong_to(:user) }
    it { is_expected.to have_many(:comments) }
  end
end
