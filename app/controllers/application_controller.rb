class ApplicationController < ActionController::Base
before_action :set_search

  def set_search
    @q = Product.search(params[:q])
    @searched_products = @q.result(distinct: true)
  end

end
