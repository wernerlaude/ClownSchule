class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    # Extrahiere ID aus "123-slug-name" Format
    id = params[:id].split("-").first.to_i
    @movie = Movie.find(id)

    # Nächstes Video
    @next_movie = Movie.where("id > ?", @movie.id).order(id: :asc).first

    # 3 zufällige andere Videos
    @related_movies = Movie.where.not(id: @movie.id).order("RANDOM()").limit(3)
  end
end
