Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  namespace :admin do
      # root to: "reservations#index"
      #
      # resources :reservation_interviews
      # resources :reservations
      # resources :repeate_interviews
      # resources :first_interviews
      # resources :users
    end

  root 'static_pages#top'

  get    '/login',  to: 'user_sessions#new'
  post   '/login',  to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'

  get '/oauth2callback', to: 'calendars#callback'

  resources :users, only: %i[new create]
  resources :password_resets, only: %i[new create edit update]

  resources :reservations, only: %i[index new create show] do
    resources :first_interviews, only: %i[new create]
    resources :repeate_interviews, only: %i[new create]
  end
  delete '/reservations/:id', to: 'reservations#delete'

  resources :contacts, only: %i[new create]

  resource :profile, only: %i[show edit update]
end
