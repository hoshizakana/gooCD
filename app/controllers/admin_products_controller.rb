class AdminProductsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @product = Product.new
    @product.songs.build
    @artists = Artist.all  #リスト選択でなく、検索フォームからの検索に後で置き換え
    @genres = Genre.all
    @labels = Label.all   #リスト選択でなく、検索フォームからの検索に後で置き換え

  end

  def create
    @product = Product.new(product_params)
    @artists = Artist.all  #リスト選択でなく、検索フォームからの検索に後で置き換え
    @genres = Genre.all
    @labels = Label.all   #リスト選択でなく、検索フォームからの検索に後で置き換え
    @product.price.to_i
    @product.stock.to_i
    if @product.save
      flash[:success] = "「#{@product.name}」が保存されました。"
      redirect_to ('/admin/products')
    else
      render :new
    end
  end

  def index
    @search = Product.ransack(params[:q])
    @genres = Genre.page(params[:page])
    if params[:product] && params[:product][:name]
      #product_name = params[:product][:name]
      #@products = Product.where("name LIKE '%#{product_name}%'")
      @products = Product.page(params[:page]).per(30).order('updated_at desc')
    else
      @products = @search.result.page(params[:page]).per(30).includes(:genre).order('updated_at desc')
    end
    #@all_ranked_product = Product.find(Favorite.group(:product_id).order('count(product_id) desc').pluck(:product_id))
  end

  #管理者商品検索機能
  def search
    @q = Product.search(search_params)
    @product = @q.result
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit

    @product = Product.find(params[:id])
    @artists = Artist.all  #リスト選択でなく、検索フォームからの検索に後で置き換え
    @genres = Genre.all
    @labels = Label.all   #リスト選択でなく、検索フォームからの検索に後で置き換え
  end

  def update
    @product = Product.find(params[:id])
    @artists = Artist.all  #リスト選択でなく、検索フォームからの検索に後で置き換え
    @genres = Genre.all
    @labels = Label.all   #リスト選択でなく、検索フォームからの検索に後で置き換え
    @product.price.to_i
    @product.stock.to_i
    if @product.update(update_product_params)
      flash[:success] = "商品情報が更新されました。"
      redirect_to ("/admin/products/#{@product.id}")
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    redirect_to "/admin/products/#{@product.id}/edit"
  end


  private
  def product_params
    params.require(:product).permit(
      :name,
      :artist_id,
      :label_id,
      :genre_id,
      :status,
      :image,
      :price,
      :stock,
      :release_date,
			:is_deleted,
      songs_attributes:[:product_id, :name, :disk]
    )
  end
  def update_product_params
    params.require(:product).permit(
      :name,
      :artist_id,
      :label_id,
      :genre_id,
      :status,
      :image,
      :price,
      :stock,
      :release_date,
			:is_deleted,
      songs_attributes:[:id, :product_id, :name, :disk, :_destroy]
    )
  end



  #管理者商品検索機能のストロングパラメーター
  def search_params
    params.require(:q).permit(:genre_name_eq)
  end

end
