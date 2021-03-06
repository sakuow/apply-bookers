Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  root to: 'homes#top'
  get '/home/about' => 'homes#about'
  devise_for :users

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end
