require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Associations' do
    it { should belong_to(:itemable) }
    it { should belong_to(:product) }
  end
end
