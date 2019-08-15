class GenresController < ApplicationController

  def index
    @search = Product.ransack(params[:q])
    @genre = Genre.new
    if params[:genre] && params[:genre][:name]
      genre_name = params[:genre][:name]
      @genres = Genre.where("name LIKE '%#{genre_name}%'")
    else
      @genres = Genre.all
    end
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    flash[:notice] = "保存されました。"
    redirect_to ('/genres')
  end

  def search
    @q = Genre.search(search_params)
    @genre = @q.result
  end


  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end
