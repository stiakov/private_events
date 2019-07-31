Rails.application.routes.draw do
  get 'events/new'
  post 'events/create'
  get 'events/show'
  get 'events/index'
  get 'myevents', to: 'events#my_events'

  root 'sessions#home'

  get 'users/new'
  post 'users/create'
  get 'index', to: 'users#show'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
