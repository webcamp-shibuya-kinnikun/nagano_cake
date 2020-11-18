class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!
  def index
    @genres = Genre.all
    @genre = Genre.new()
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admins_genres_path (@genre)
    else
       @genres = Genre.all
      render template: 'admins/genres/index'
    end
  end

  def edit
    @genre = Genre.find(params[:id])

  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to admins_genres_path()
    else
      render template: 'admins/genres/edit'
      # render edit_admins_genre_path(@genre)
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name, :is_valid)
  end


end
