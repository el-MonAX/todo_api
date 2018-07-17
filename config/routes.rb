# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: { sessions: :sessions }
  end

  resources :projects
  resources :tasks
  resources :comments
end
