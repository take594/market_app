require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    it '有効なユーザーは保存できる' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    it '名前がないと無効' do
      user = FactoryBot.build(:user, name: nil)
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("を入力してください")
    end

    it 'メールアドレスがないと無効' do
      user = FactoryBot.build(:user, email: nil)
      expect(user).not_to be_valid
    end

    it 'パスワードがないと無効' do
      user = FactoryBot.build(:user, password: nil)
      expect(user).not_to be_valid
    end
  end

  describe '#own?' do
    let(:user) { FactoryBot.create(:user) }
    let(:other_user) { FactoryBot.create(:user) }
    let(:item) { FactoryBot.create(:item, user: user) }

    it '商品の作成ユーザーが自分なら true を返す' do
      expect(user.own?(item)).to be true
    end

    it '商品の作成ユーザーが自分でないなら false を返す' do
      expect(other_user.own?(item)).to be false
    end
  end
end
