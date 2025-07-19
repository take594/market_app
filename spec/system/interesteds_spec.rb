require 'rails_helper'

RSpec.describe '気になる機能', type: :system do
  let(:seller) { FactoryBot.create(:user) }
  let(:buyer)  { FactoryBot.create(:user) }
  let(:item)  { FactoryBot.create(:item, user: seller) }

  before do
    driven_by(:rack_test)
  end

  context 'ログインユーザーが他人の商品に対して' do
    before do
      sign_in(buyer)
    end

    it '気になるを登録できる' do

      visit item_path(item)

      click_on '☆'
 
      expect(page).to have_content('気になる数1')

      expect(page).to have_content('★')
    end

    it '気になるを解除できる' do
      
      Interested.create(user: buyer, item: item)

      visit item_path(item)
      
      click_on '★'
      expect(page).to have_content('気になる数0')

      expect(page).to have_content('☆') 
    end
  end
end
