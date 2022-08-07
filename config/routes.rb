# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :auth do
      post 'login', action: :login, controller: :auth
    end

    namespace :v1 do
      # route. action & controller
      resources :users, only: %i[index show create update destroy]
      root 'api/vi/users#index'
    end
  end
end
