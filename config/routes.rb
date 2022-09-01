Rails.application.routes.draw do
  root 'static_pages#top'

  get    '/login',  to: 'user_sessions#new'
  post   '/login',  to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'

  get '/oauth2callback', to: 'calendars#callback'

  resources :users, only: %i[new create]
  resources :reservations, only: [:index, :new, :create, :edit, :show]
  delete '/reservations/:id', to: 'reservations#delete'
end
