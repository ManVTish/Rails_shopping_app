require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:comment) }
  end

  describe 'Associations' do
    it { should have_many(:items) }
    it { should belong_to(:user) }
  end
end
