class GenresController < ApplicationController
  def index
    @genre = Genre.new

  end

  def create
    genre = Genre.new(params[:id])
    genre.save
    flash[:notice] = "保存されました。"
    redirect_to ('/genres')
  end
end
