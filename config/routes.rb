Crowfounder::Application.routes.draw do

  resources :users

  get 'users/new', to: 'users#index', as: 'new_user'

  root to: "welcome#home"

  get "welcome/home"

  get "welcome/projects"

  resources :projects
end
