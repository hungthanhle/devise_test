Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "sessions"}, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "static_pages#home"

  # get '/auth/slack/callback', to: 'sessions#slack'
  
  devise_scope :user do
    # get 'sign_in', to: 'devise/sessions#new'
    get '/auth/slack/callback', to: 'sessions#slack'
  end
end
