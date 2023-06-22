require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:category) }
    it { should validate_numericality_of(:price) }
  end

  describe 'Associations' do
    it { should have_many(:reviews) }
  end
end
