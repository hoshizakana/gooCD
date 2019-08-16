class AdminUsersController < ApplicationController
  def show
		@user = User.find(params[:id])
		# @orders = Order.find(params[:user_id]) # 正しいのか？
  end

  def edit
		@user = User.find(params[:id])
  end

  def index
		@search = User.ransack(params[:q])
		@result = @search.result
		# @users = User.all これなしでも、全件表示可能
		# resultには空条件で検索した結果（つまりすべてのレコード）が入る為
  end
end
