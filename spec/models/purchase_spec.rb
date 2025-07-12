require 'rails_helper'

RSpec.describe Purchase, type: :model do
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
    it '有効な購入情報を作成できる' do
      purchase = FactoryBot.build(:purchase)
      expect(purchase).to be_valid
    end
  end
end
