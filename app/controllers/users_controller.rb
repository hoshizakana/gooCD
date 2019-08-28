class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :edit, :update, :orders, :destroy_confirm]

  def show
    @user = User.find(params[:id])
    @useraddresses = @user.addresses
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "プロフィールの編集が完了しました。"
      redirect_to ("/users/#{@user.id}")
    else
      render :edit
    end
  end

  def destroy_confirm
    @user = current_user
  end
  def soft_destroy
    user = current_user
    addstr = Date.today.strftime("%Y.%m.%d")
    user.email += addstr
    user.is_deleted = true
    if user.update(user_destroy_params)
      flash[:notice] = "退会しました"
      redirect_to destroy_user_session_path, method: :delete
      binding.pry
    else
      redirect_to "show"
    end
  end

  def orders
    @orders = Order.where(user_id: current_user.id).page(params[:page]).per(10)
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :phone, :postal_code, :adress)
  end
  def user_destroy_params
    params.permit(:email, :is_deleted)
  end

  def correct_user
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to "/"
    end
  end

end
