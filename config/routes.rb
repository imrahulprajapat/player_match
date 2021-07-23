# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  resources :match do
    get :finish_match
  end
  post 'match/:match_id/add_score/:player_id', to: 'match#add_score', as: :match_add_score
end
