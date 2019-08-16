class ArtistsController < ApplicationController
  def index
    @artist = Artist.new
    @artists = Artist.all

  end

  def create
    artist = Artist.new(artist_params)
    artist.save
    flash[:notice] = "保存されました。"
    redirect_to ('/artists')
  end

  private
  def artist_params
    params.require(:artist).permit(:name)
  end

end