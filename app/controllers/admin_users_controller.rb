class AdminUsersController < ApplicationController
  before_action :authenticate_admin!

  def show
		@user = User.find(params[:id])
		# @orders = Order.find(params[:user_id]) # 正しいのか？
  end

  def edit
		@user = User.find(params[:id])
  end
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "会員情報の編集が完了しました"
			redirect_to ("/admin/users/#{@user.id}")
		else
			render :edit
		end
	end

  def index
		@search = User.ransack(params[:q])
		@result = @search.result.page(params[:page]).per(30).order('created_at desc')
		# @users = User.all これなしでも、全件表示可能
		# resultには空条件で検索した結果（つまりすべてのレコード）が入る為
  end

	private
	def user_params
		params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :phone, :postal_code, :adress, :is_deleted)
	end
end
