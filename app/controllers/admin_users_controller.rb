class AdminUsersController < ApplicationController
  def show
		@user = User.find(params[:id])
  end

  def edit
		@user = User.find(params[:id])
  end

  def index
		@search = Product.ransack(params[:q])
		@result = @search.result
		@products = Product.all
  end
end
