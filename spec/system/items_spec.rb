require 'rails_helper'

RSpec.describe '商品出品', type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    driven_by(:rack_test)
    sign_in(user)
  end

  it '正しい情報を入力すれば商品を出品できる' do
    visit new_item_path

    fill_in 'タイトル', with: 'テスト商品'
    attach_file '商品画像', Rails.root.join('spec/fixtures/sample.jpg')
    fill_in '値段', with: 3000
    select 'ホビー', from: 'カテゴリー'
    fill_in '商品紹介', with: 'これはテスト用の商品です'

    click_button 'この商品を出品する'

    expect(page).to have_content('商品を出品しました')
    expect(Item.last.title).to eq('テスト商品')
    expect(Item.last.user).to eq(user)
  end

  it 'タイトルが空欄だと出品できず、エラーが表示される' do
    visit new_item_path

    attach_file '商品画像', Rails.root.join('spec/fixtures/sample.jpg')
    fill_in '値段', with: 3000
    select 'ホビー', from: 'カテゴリー'
    fill_in '商品紹介', with: 'これはテスト用の商品です'

    click_button 'この商品を出品する'

    expect(page).to have_content('タイトルを入力してください')
  end

  it '商品の情報が修正できる' do
    item = FactoryBot.create(:item, user: user)
    visit edit_item_path(item)

    fill_in 'タイトル', with: 'テスト商品2'
    attach_file '商品画像', Rails.root.join('spec/fixtures/sample.jpg')
    fill_in '値段', with: 3000
    select 'ホビー', from: 'カテゴリー'
    fill_in '紹介文', with: 'これはテスト用の商品です'

    click_button '出品情報を登録する'

    expect(page).to have_content('商品の情報を更新しました')
    expect(Item.last.title).to eq('テスト商品2')
  end
end
