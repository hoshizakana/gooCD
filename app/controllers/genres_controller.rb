class GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all

  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    flash[:notice] = "保存されました。"
    redirect_to ('/genres')
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end
