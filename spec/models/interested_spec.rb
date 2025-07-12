require 'rails_helper'

RSpec.describe Interested, type: :model do
  describe 'アソシエーション' do
    it 'User に属している' do
      assoc = described_class.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end

    it 'Item に属している' do
      assoc = described_class.reflect_on_association(:item)
      expect(assoc.macro).to eq :belongs_to
    end
  end

  describe '有効なファクトリ' do
    it '有効な interested を作成できる' do
      interested = FactoryBot.build(:interested)
      expect(interested).to be_valid
    end
  end
end
