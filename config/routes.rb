Rails.application.routes.draw do
  root 'messages#new'

  resources :messages, only: [:new, :show]
  
  get '/messages/:id/' => 'messages#show'
  get '/home/:id/' => 'messages#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end