Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })
  get("/directors", { :controller => "directors", :action => "all" })
  get("/directors/youngest", { :controller => "directors", :action => "youngest" })
  get("/directors/eldest", { :controller => "directors", :action => "eldest" })
  get("/directors/:id", { :controller => "directors", :action => "id" })
  get("/movies", { :controller => "movies", :action => "all" })
  get("/movies/:id", { :controller => "movies", :action => "id" })
  get("/actors", { :controller => "actors", :action => "all" })
  get("/actors/:id", { :controller => "actors", :action => "id" })
end
