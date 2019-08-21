class ApplicationController < ActionController::Base
before_action :set_search

  def set_search
    @q = Product.search(params[:q])
    @searched_products = @q.result(distinct: true)
  end

<<<<<<< HEAD
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_orders_path
    when User
      "/"
    end
  end

  def after_sign_out_path_for(resource)
    # case resource
    # when Admin
    #   new_admin_session_path
    # when User
    #   "/"
    # end

    "/"
  end

=======
	include ApplicationHelper, CartHelper
>>>>>>> b62cd7cf71535047f920fa53ee65fd07554eb4b5
end
