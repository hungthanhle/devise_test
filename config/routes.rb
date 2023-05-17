Rails.application.routes.draw do
  resources :users
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "static_pages#home"
  get '/help', to: "static_pages#help"
  get '/admin', to: "static_pages#admin"
  # devise_scope :user do
  #   get 'sign_in', to: 'devise/sessions#new'
  # end
end
