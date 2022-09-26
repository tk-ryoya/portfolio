class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def edit; end

  def show; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, success: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :tel, :email)
  end
end
