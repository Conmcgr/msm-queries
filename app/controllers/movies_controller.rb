class MoviesController < ApplicationController
  def all
    @movies = Movie.all
    Movie.includes(:director).all
    render({ :template => "movies_templates/all_movies"})
  end

  def id
    @movie = Movie.find(params[:id])
    @director = Director.find_by(id: @movie.director_id)
    render({ :template => "movies_templates/one_movie"})
  end
end
