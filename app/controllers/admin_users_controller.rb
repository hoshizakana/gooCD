class AdminUsersController < ApplicationController
  def show
		@user = User.find(params[:id])
  end

  def edit
		@user = User.find(params[:id])
  end

  def index
		@search_params = user_search_params
		@users = User.search(@search_params)
		# @users = User.all
  end

	private
	def user_search_params
		params.fetch(:search, {}).permit(:id, :email, :phone, :name)
		# requireでなくfetchにすることで、空の時には空の内容を返す。（初期表示でエラーしない）
end
