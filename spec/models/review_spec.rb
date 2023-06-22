require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:comments) }
    it { should validate_presence_of(:ratings) }
  end

  describe 'Associations' do
    it { should belong_to(:product) }
    it { should belong_to(:user) }
  end
end
