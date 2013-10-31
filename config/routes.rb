DrawingTracker::Application.routes.draw do

  root to: "drawings#index"

  resources :projects

  resources :drawings

end
