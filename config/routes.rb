DrawingTracker::Application.routes.draw do

  root to: "projects#index"

  resources :projects

  resources :drawings

  get "/projects/:id/by_status", to: "projects#by_status"

end
