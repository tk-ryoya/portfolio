Rails.application.routes.draw do
  namespace :admin do
      root to: "reservations#index"

      resources :reservation_interviews
      resources :reservations
      resources :repeate_interviews
      resources :first_interviews
      resources :users
    end

  root 'static_pages#top'

  get    '/login',  to: 'user_sessions#new'
  post   '/login',  to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'

  get '/oauth2callback', to: 'calendars#callback'

  resources :users, only: %i[new create]
  resources :reservations, only: [:index, :new, :create, :update, :show] do
    resources :first_interviews, only: [:new, :create]
    resources :repeate_interviews, only: [:new, :create]
  end
  delete '/reservations/:id', to: 'reservations#delete'
end
