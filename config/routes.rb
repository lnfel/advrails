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
  
  get '/check.txt', to: proc {[200, {}, ['it_works']]}
end
