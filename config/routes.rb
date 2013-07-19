Crowfounder::Application.routes.draw do

  get "pledges/new"

  get "pledges/edit"

  get "sessions/new"

	resource :session

  resources :users

  get 'users/new', to: 'users#index', as: 'new_user'

  root to: "welcome#home"

  resources :projects do
  	resources :pledges, except: [:index]
  end
end
