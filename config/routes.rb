# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: { sessions: 'api/v1/sessions', registrations: 'api/v1/registrations' }
      root to: 'projects#index'
      resources :projects do
        resources :tasks, only: %i[index create] do
          resources :comments, only: %i[index create]
        end
      end
      resources :tasks, only: %i[show update destroy]
      resources :comments, only: %i[show update destroy]
    end
  end
end
