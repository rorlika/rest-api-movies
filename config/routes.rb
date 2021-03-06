Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: :show

      resources :contents, only: :index
      resources :movies, only: :index
      resources :seasons, only: :index

      resources :libraries, only: %i[index create]
    end
  end
end
