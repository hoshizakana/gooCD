class ApplicationController < ActionController::Base
before_action :set_search
before_action :configure_permitted_parameters, if: :devise_controller?

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

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope ==  :admin
      admin_orders_path
    else
      "/"
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :adress, :phone])
  end

	include ApplicationHelper
end
