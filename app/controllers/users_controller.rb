class UsersController < ApplicationController

  before_action :current_user_mypage

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
  end

  def orders
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :phone, :postal_code, :adress)
  end

  def current_user_mypage
    if current_user.id != @user.id
      redirect_to "/"
    end
  end

end
