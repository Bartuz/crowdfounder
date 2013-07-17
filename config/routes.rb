Crowfounder::Application.routes.draw do
  

  root to: "welcome#home"

  get "welcome/home"

  get "welcome/projects"

  resources :projects
end
