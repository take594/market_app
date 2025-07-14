class ProfilesController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
   before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit 
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "プロフィールを更新しました"
      redirect_to profile_path
    else
      flash[:notice] = "プロフィール情報の変更に失敗しました"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:image,:name, :introduction )
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:image, :name, :introduction])
  end
end
