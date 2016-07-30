Rails.application.routes.draw do
  devise_for :users

  get 'pages/home'

  root :to => 'pages#home'

  resources :groups do
    resources :memberships
  end

  resources :tasks do
    member do
      put 'claim'
      put 'mark_complete'
    end
  end
end

