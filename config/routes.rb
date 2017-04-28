# frozen_string_literal: true
Rails.application.routes.draw do
  resources :recipes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: %i[index show]
  resources :examples, except: %i[new edit]
  resources :ingredients, only: %i[index show destroy update create]
  resources :recipes, except: %i[new edit]
end
