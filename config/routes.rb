Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "languages#index"
  resource :profile, only:[:show, :edit, :update]
  resource :service, only:[:edit, :update]
  resources :languages do
    resources :articles 
  end
  resources :articles do
    resources :comments
  end
  resources :accounts, only:[:show] do
    resources :follows, only:[:index,:create]
    resources :unfollows, only:[:index,:create]
    resource :relation, only:[:show]
  end
  resources :errors, only:[:show]
  resource :timeline, only:[:index, :show]
end
