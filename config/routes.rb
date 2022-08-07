# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # route. action & controller
      resources :users, only: %i[index show create update destroy]
      root 'api/vi/users#index'
    end
  end
end
