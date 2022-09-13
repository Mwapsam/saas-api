Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :categories, only: [:index, :create, :update, :destroy] do
        get :image, on: :member
      end
      resources :tracks, only: [:index, :create, :update, :destroy] do
        get :image, on: :member
        get :audio, on: :member
      end
    end
  end
end
