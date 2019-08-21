class ApplicationController < ActionController::Base
before_action :set_search

  def set_search
    @q = Product.search(params[:q])
    @searched_products = @q.result(distinct: true)
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_orders_path
    when User
      "/"
    end
  end

	include ApplicationHelper, CartHelper
end
