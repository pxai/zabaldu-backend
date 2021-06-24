# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'api/v1/version#index'
  namespace :api do
    namespace :v1 do
      get 'users/sign_out'
      post 'users/sign_up' => 'users#sign_up_save'
      post 'users/index' => 'users#sign_in'
      #resources :examples, only: %i[show index create update]
      get 'version' => 'version#index'

      post 'notifications/add'
      post 'notifications/remove'
      post 'notifications/notify_me'
      post 'notifications/notify_all'

      resources :articles
      resources :comments
      resources :tags, only: %i[show index]
      resources :statuses, only: %i[show index]
      resources :categories, only: %i[show index]
    end
  end
end
