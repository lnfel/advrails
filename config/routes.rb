Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  get '/check.txt', to: proc {[200, {}, ['it_works']]}
end
