# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  resources :channels do
    resources :channel_user
  end
  namespace :admin do
    resources :users
    resources :notifications
    resources :announcements
    resources :services

    root to: 'users#index'
  end
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'channels#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
