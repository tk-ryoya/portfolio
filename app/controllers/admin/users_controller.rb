class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: %i[edit update show destroy]

  def index
    @users = User.all
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), success: t('.success')
    else
      flash.now[:error] = t('.success')
      render :edit
    end
  end

  def show; end

  def destroy
    @user.destroy!
    redirect_to admin_users_path, success: t('.success')
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :tel, :email)
  end
end
