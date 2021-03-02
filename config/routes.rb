Rails.application.routes.draw do
  root 'pictures#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update] do
    resources :favorites, only: [:index]
  end
  resources :pictures do
    collection do
      post :confirm
    end
    resource :favorites, only: [:create, :destroy]
  end
end
