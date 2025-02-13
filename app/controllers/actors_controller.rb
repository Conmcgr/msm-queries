class ActorsController < ApplicationController
  def all
    @actors = Actor.all
    render({ :template => "actors_templates/all_actors"})
  end

  def id
    @actor = Actor.find(params[:id])
  
    character_entries = Character.where(actor_id: @actor.id)
    movie_ids = character_entries.pluck(:movie_id)

    @movies = Movie.where(id: movie_ids)
    @character_names = character_entries.index_by(&:movie_id).transform_values(&:character_name)
    @directors = Director.where(id: @movies.pluck(:director_id)).index_by(&:id)
    
    render({ :template => "actors_templates/one_actor" })
  end
  
end
