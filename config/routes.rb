Clk::Application.routes.draw do

  root :to => 'Home#index'

  resources :password_resets

  resources :users
  match "users/:username" => "Users#show"
  match "users/:username/edit" => "Users#edit"

  resources :posts

  resources :sessions
  get "sessions/destroy"
  get "logout" => "sessions#destroy", :as => "logout"
  match "login" => "Sessions#new"
end
