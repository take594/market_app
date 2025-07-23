class HomesController < ApplicationController
  before_action :set_search
  def top
  end

  def set_search
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
  end

  def guest_sign_in
    user = User.find_or_create_by!(email:'guest@mail.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
    sign_in user
    flash[:notice] = 'ゲストユーザーとしてログインしました'
    redirect_to root_path 
  end
end
