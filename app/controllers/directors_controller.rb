class DirectorsController < ApplicationController
  def all
    @directors = Director.all
    render({ :template => "directors_templates/all_directors"})
  end

  def youngest
    @youngest = Director.where.not(dob: nil).order(:dob).last
    date = @youngest.dob
    @birthday = "#{date.strftime('%B')} #{date.day.ordinalize}, #{date.year}"
    render({ :template => "directors_templates/youngest"})
  end

  def eldest
    @eldest = Director.where.not(dob: nil).order(:dob).first
    date = @eldest.dob
    @birthday = "#{date.strftime('%B')} #{date.day.ordinalize}, #{date.year}"
    render({ :template => "directors_templates/eldest"})
  end

  def id
    @director = Director.find(params[:id])
    @movies = Movie.where(director_id: @director.id)
    render({ :template => "directors_templates/one_director"})
  end
end
