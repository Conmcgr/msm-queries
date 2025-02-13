class DirectorsController < ApplicationController
  def all
    @directors = Director.all
    render({ :template => "directors_templates/all_directors"})
  end

  def youngest
    render({ :template => "directors_templates/youngest"})
  end

  def eldest
    render({ :template => "directors_templates/eldest"})
  end

  def id
    @director = Director.find(params[:id])
    @movies = Movie.where(director_id: @director.id)
    render({ :template => "directors_templates/one_director"})
  end
end
