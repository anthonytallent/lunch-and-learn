Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :favorites, only: [:create, :index]
      resources :learning_resources, only: [:index]
      resources :recipes, only: [:index], controller: 'recipes'
    end
  end
end
