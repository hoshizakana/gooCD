class AdminUsersController < ApplicationController
  def show
		@user = User.find(params[:id])
		@orders = Order.find(params[:user_id]) # 正しいのか？
  end

  def edit
		@user = User.find(params[:id])
  end

  def index
		@search = User.ransack(params[:q])
		@result = @search.result
		# @users = User.all
  end
end
