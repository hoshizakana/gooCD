class ArtistsController < ApplicationController

  def index
    @search = Product.ransack(params[:q])
    @artist = Artist.new
    if params[:artist] && params[:artist][:name]
      artist_name = params[:artist][:name]
      @artists = Artist.where("name LIKE '%#{artist_name}%'")
    else
      @artists = Artist.all
    end
  end

  def create
    artist = Artist.new(artist_params)
    artist.save
    flash[:notice] = "保存されました。"
    redirect_to ('/artists')
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    flash[:notice] = "削除されました。"
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

end
