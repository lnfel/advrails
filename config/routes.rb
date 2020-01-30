Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'site#index'
  get '/about', to: 'site#about'
  get '/help', to: 'site#help'
  get '/contact', to: 'site#contact'
  get '/terms', to: 'site#terms'

  # Users
  get '/signup', to: 'users#new'

  # Dashboard
  #resources :dashboard, only: [:index]
  #get '/dashboard', to: 'dashboard#index'

  # Posts
  resources :posts

  get :search, controller: :posts
  get :autocomplete, controller: :posts

  # for typeahead but is not working due to bloodhound 
  #resources :posts do
  #  collection do
  #    get :search
  #  end
  #end
  #get '/post', to: 'post#index'
  
  get '/check.txt', to: proc {[200, {}, ['it_works']]}
end
