DrawingTracker::Application.routes.draw do

  root to: "projects#index"

  resources :projects

  resources :drawings

end
