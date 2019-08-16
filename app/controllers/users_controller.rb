class UsersController < ApplicationController
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
      flash[:notice] = "プロフィールの編集が完了しました"
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
    params.require(:user).permit(:email)
  end

end
