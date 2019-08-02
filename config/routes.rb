Rails.application.routes.draw do
  get 'invitations/new'
  get 'invite', to: 'invitations#new'
  post 'invite/create', to: 'invitations#create'

  get 'events/new'
  post 'events/create'
  match '/events/show/:id', to: 'events#show', via: :get, as: :events_show
  get 'events/index'
  get 'myevents', to: 'events#my_events'

  post 'attendances/create'

  root 'sessions#home'

  get 'users/new'
  post 'users/create'
  get 'users/show'
  get 'index', to: 'users#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
