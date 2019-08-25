class ArtistsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @search = Product.ransack(params[:q])
    @artist = Artist.new
    if params[:artist] && params[:artist][:name]
      artist_name = params[:artist][:name]
      @artists = Artist.where("name LIKE '%#{artist_name}%'")
    else
      @artists = Artist.all
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @artist = Artist.new(artist_params)
    @search = Product.ransack(params[:q])
    if params[:artist] && params[:artist][:name]
      artist_name = params[:artist][:name]
      @artists = Artist.where("name LIKE '%#{artist_name}%'")
    else
      @artists = Artist.all
    end
    respond_to do |format|
      format.html
      format.js
    end
    if @artist.save
      flash[:success] = "「#{@artist.name}」が保存されました。"
      redirect_to ('/artists')
    else
      render :index
    end
  end

  def edit
    @id_artist = Artist.find(params[:id]).id
    @artist = Artist.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @id_artist = Artist.find(params[:id]).id
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      respond_to do |format|
        format.html
        format.js
      end
    else
      render :index
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    flash[:warning] = "「#{@artist.name}」削除されました。"
    redirect_to ('/artists')
  end

  def search
    @q = Artist.search(search_params)
    @artist = @q.result
  end


  private
  def artist_params
    params.require(:artist).permit(:name)
  end

  def search_params
    params.require(:q).permit(:artist)
  end

  def set_variables
    
  end

end
