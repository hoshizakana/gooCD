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
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @artist = Artist.find(@product.artist_id)
  end

  def edit
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

end
