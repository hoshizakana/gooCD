class AdminProductsController < ApplicationController
  def new
    @product = Product.new
    8.times { @product.songs.build }
    @artists = Artist.all  #リスト選択でなく、検索フォームからの検索に後で置き換え
    @genres = Genre.all
    @labels = Label.all   #リスト選択でなく、検索フォームからの検索に後で置き換え

  end

  def create
    product = Product.new(product_params)
    product.price.to_i
    product.stock.to_i
    product.save
    flash[:notice] = "保存されました。"
    redirect_to ('/admin/products')
  end

  def index
    @search = Product.ransack(params[:q])
    @genres = Genre.all
    @products = @search.result.includes(:genre)
  end

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
    product = Product.find(params[:id])
    product.price.to_i
    product.stock.to_i
    product.update(product_params)
    flash[:notice] = "更新されました。"
    redirect_to ("/admin/products/#{product.id}")
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
      songs_attributes:[:id, :product_id, :name, :disk]
    )

  end

  def search_params
    params.require(:q).permit(:genre_name_eq)
  end

end
