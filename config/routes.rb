# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # route. action & controller
      resources :users, only: %i[index create update destroy]
      # post 'add_user', action: :add_user, controller: :users
    end
  end
end
