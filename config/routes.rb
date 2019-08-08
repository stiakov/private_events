Rails.application.routes.draw do
  root 'sessions#home'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, only: %i[new create show]
  get 'index', to: 'users#index'

  resources :events, only: %i[new create index my_events]
  match '/events/show/:id', to: 'events#show', via: :get, as: :events_show
  get 'myevents', to: 'events#my_events'

  post 'attendances/create'
  delete 'attendances/destroy'

  get 'invitations/new'
  get 'invite', to: 'invitations#new'
  post 'invite/create', to: 'invitations#create'
end
