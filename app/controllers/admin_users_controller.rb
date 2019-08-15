class AdminUsersController < ApplicationController
  def show
		@user = User.find(parms[:id])
  end

  def edit
		@user = User.find(parms[:id])
  end

  def index
		@users = User.all
  end
end
