require 'rails_helper'

RSpec.describe 'ユーザー認証機能', type: :system do
  let(:user) { FactoryBot.create(:user, password: 'password123') }

  describe '新規登録' do
    it '有効な情報で登録できる' do
      visit new_user_registration_path

      fill_in '名前', with: 'テストユーザー'
      fill_in 'Eメール', with: 'test@example.com'
      fill_in 'パスワード', with: 'password123'
      fill_in 'パスワード確認用', with: 'password123'

      click_button '登録する'

      expect(page).to have_content('アカウントを登録しました')
    end

    it '無効な情報では登録できない' do
      visit new_user_registration_path

      fill_in '名前', with: ''
      fill_in 'Eメール', with: 'invalid'
      fill_in 'パスワード', with: '123'
      fill_in 'パスワード確認用', with: '321'

      click_button '登録する'

      expect(page).to have_content('アカウントの登録に失敗しました')
    end
  end

  describe 'ログイン' do
    it '正しい情報でログインできる' do
      visit new_user_session_path

      fill_in 'Eメール', with: user.email
      fill_in 'パスワード', with: 'password123'
      click_button 'ログインする'

      expect(page).to have_content(user.name)
    end

    it '間違った情報でログインできない' do
      visit new_user_session_path

      fill_in 'Eメール', with: user.email
      fill_in 'パスワード', with: 'wrongpassword'
      click_button 'ログインする'

      expect(page).to have_content('ログインする')
    end
  end

  describe 'ログアウト' do
    it 'ログイン後にログアウトできる' do
      sign_in(user)
      visit root_path

      click_button user.name

      click_link 'ログアウト'

      expect(page).to have_content('ログイン')
    end
  end


  describe 'アカウント編集' do
    it '有効な情報で変更できる' do
      sign_in(user)
      visit edit_user_registration_path

      fill_in 'Eメール', with: 'test@example.com'
      fill_in 'パスワード', with: 'password123'
      fill_in 'パスワード確認用', with: 'password123'
      fill_in '現在のパスワード', with: 'password123'

      click_button '更新する'

      expect(page).to have_content('アカウント情報を変更しました')
    end

    it '無効な情報では変更できない' do
      sign_in(user)
      visit edit_user_registration_path

      fill_in 'Eメール', with: 'invalid'
      fill_in 'パスワード', with: '123'
      fill_in 'パスワード確認用', with: '321'
      fill_in '現在のパスワード', with: 'password123'

      click_button '更新する'

      expect(page).to have_content('アカウント情報の変更に失敗しました')
    end
  end

  describe 'プロフィール編集' do
    it 'プロフィールを編集できる' do
      sign_in(user)
      visit edit_profile_path

      attach_file 'プロフィール画像', Rails.root.join('spec/fixtures/sample.jpg')
      fill_in '名前', with: 'プロフィール'
      fill_in '自己紹介', with: '変更します'

      click_button '登録完了する'

      expect(page).to have_content('プロフィールを更新しました')
    end
  end
end
