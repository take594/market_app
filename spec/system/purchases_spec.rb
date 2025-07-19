require 'rails_helper'

RSpec.describe '商品購入機能', type: :system do
  let(:seller) { FactoryBot.create(:user) }
  let(:buyer)  { FactoryBot.create(:user) }
  let(:item)   { FactoryBot.create(:item, user: seller) }

  before do
    driven_by(:rack_test)
  end

  context '購入ページで' do
    it 'ログインしたユーザーが商品を購入できる' do
      sign_in(buyer)
      visit new_purchase_path(item)

      expect(page).to have_content(item.title)
      click_button '商品を購入する'

      expect(page).to have_content('購入を確定しました') 
      expect(Purchase.last.user).to eq(buyer)
      expect(Purchase.last.item).to eq(item)
      expect(Purchase.last.item.onSale).to eq(false)
    end
    it '購入者が商品の到着報告と評価を行える' do
      sign_in(buyer)
      purchase = Purchase.create(user: buyer, item: item)
      item_user = item.user
      item_user.update(likes: 5)

      visit edit_purchase_path(purchase)
      select '届いた', from:'到着状況' 
      select 'よかった', from: '出品者の評価' 

      click_button '商品の到着状況を報告する'

      expect(page).to have_content('商品の到着状況を報告しました')
      expect(item_user.reload.likes).to eq(6) 
    end
  end
end
