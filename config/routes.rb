Rails.application.routes.draw do
  # Routes for the Category resource:
  # CREATE
  get "/categories/new", :controller => "categories", :action => "new"
  post "/create_category", :controller => "categories", :action => "create"

  # READ
  get "/categories", :controller => "categories", :action => "index"
  get "/categories/:id", :controller => "categories", :action => "show"

  # UPDATE
  get "/categories/:id/edit", :controller => "categories", :action => "edit"
  get "/update_category/:id", :controller => "categories", :action => "update"

  # DELETE
  get "/delete_category/:id", :controller => "categories", :action => "destroy"
  #------------------------------

  # Routes for the Round resource:
  # CREATE
  get "/rounds/new", :controller => "rounds", :action => "new"
  post "/create_round", :controller => "rounds", :action => "create"

  # READ
  get "/rounds", :controller => "rounds", :action => "index"
  get "/rounds/:id", :controller => "rounds", :action => "show"

  # UPDATE
  get "/rounds/:id/edit", :controller => "rounds", :action => "edit"
  post "/update_round/:id", :controller => "rounds", :action => "update"

  # DELETE
  get "/delete_round/:id", :controller => "rounds", :action => "destroy"
  #------------------------------

  # Routes for the Game resource:
  # CREATE
  get "/games/new", :controller => "games", :action => "new"
  post "/create_game", :controller => "games", :action => "create"

  # READ
  get "/games", :controller => "games", :action => "index"
  get "/games/:id", :controller => "games", :action => "show"

  # UPDATE
  get "/games/:id/edit", :controller => "games", :action => "edit"
  post "/update_game/:id", :controller => "games", :action => "update"

  # DELETE
  get "/delete_game/:id", :controller => "games", :action => "destroy"
  #------------------------------

  # Routes for the Clue resource:
  # CREATE
  get "/clues/new", :controller => "clues", :action => "new"
  post "/create_clue", :controller => "clues", :action => "create"

  # READ
  get "/clues", :controller => "clues", :action => "index"
  get "/clues/:id", :controller => "clues", :action => "show"

  # UPDATE
  get "/clues/:id/edit", :controller => "clues", :action => "edit"
  get "/update_clue/:id", :controller => "clues", :action => "update"

  # DELETE
  get "/delete_clue/:id", :controller => "clues", :action => "destroy"
  #------------------------------

  #Routes for analytics
  get "/analytics", :controller => "analytics", :action => "show"
  get "/analytics/update_daterange", :controller => "analytics", :action => "update"

  root 'games#new'

  devise_for :users
  end
