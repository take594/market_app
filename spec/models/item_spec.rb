require 'rails_helper'

RSpec.describe Item, type: :model do

  describe 'アソシエーション' do
    let(:user) { FactoryBot.create(:user) }

    it 'User に属している' do
      assoc = described_class.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end
  end

  describe 'バリデーションのテスト' do
    let(:user) { FactoryBot.create(:user) }

    it 'すべての属性が揃っていれば有効' do
      item = FactoryBot.build(:item, user: user)
      expect(item).to be_valid
    end

    it 'タイトルがなければ無効' do
      item = FactoryBot.build(:item, title: nil)
      expect(item).not_to be_valid
      expect(item.errors[:title]).to include("を入力してください")
    end

    it '画像がなければ無効' do
      item = FactoryBot.build(:item, image: nil)
      expect(item).not_to be_valid
      expect(item.errors[:image]).to include("を入力してください")
    end

    it '値段がなければ無効' do
      item = FactoryBot.build(:item, price: nil)
      expect(item).not_to be_valid
      expect(item.errors[:price]).to include("を入力してください", "は数値で入力してください")
    end

    it '値段が1円以下なら無効' do
      item = FactoryBot.build(:item, price: 1)
      expect(item).not_to be_valid
    end

    it 'カテゴリがなければ無効' do
      item = FactoryBot.build(:item, category: nil)
      expect(item).not_to be_valid
    end
  end

  describe '#interested_by?' do
    let(:user) { FactoryBot.create(:user) }
    let(:item) { FactoryBot.create(:item) }

    it 'すでに気になるを押したユーザーなら true を返す' do
      item.interesteds.create(user: user)
      expect(item.interested_by?(user)).to be true
    end

    it '気になるを押していないユーザーなら false を返す' do
      expect(item.interested_by?(user)).to be false
    end
  end
end
