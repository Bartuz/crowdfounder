Crowfounder::Application.routes.draw do

  get "sessions/new"

  resource :session, only: [:create,:new,:destroy]

  resources :users, except: [:index]

  root to: "welcome#home"

  resources :projects, only: [:show,:index] do
  	resources :pledges, except: [:index]
  	resources :images
  end

  namespace :my do
  	resources :projects do
  		resources :images
  	end
  end

end
