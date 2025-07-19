module SystemHelpers
  def sign_in(user)
    visit new_user_session_path
    fill_in 'Eメール', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'ログインする'
  end
end

RSpec.configure do |config|
  config.include SystemHelpers, type: :system
end
