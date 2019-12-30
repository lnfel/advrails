Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'site#index'
  get '/about', to: 'site#about'
  get '/help', to: 'site#help'
  get '/contact', to: 'site#contact'
  get '/terms', to: 'site#terms'

  get '/signup', to: 'users#new'
  
  get '/check.txt', to: proc {[200, {}, ['it_works']]}
end
