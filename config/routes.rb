Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'application#dashbord'
  # login session routes
  get '/sign_in', to: 'sessions#new', as: :sign_in
  post '/sign_in', to: 'sessions#create', as: :attempt_sign_in
  delete '/sign_out', to: 'sessions#destroy', as: :sign_out
end
