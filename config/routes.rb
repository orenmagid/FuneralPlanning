Rails.application.routes.draw do
  get 'static_pages/home'
  root "static_pages#home"

  get 'users/summary', to: 'users#summary'

  resources :users, param: :username do
    resources :contacts, except: [:show]
    resources :funerals
  end

  get 'home', to: 'users#show', as: :home

  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'


end
