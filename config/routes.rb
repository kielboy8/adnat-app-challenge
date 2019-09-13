Rails.application.routes.draw do
  root 'sessions#new'
  patch 'join', to: 'join_organizations#update'
  delete 'leave', to: 'join_organizations#destroy'
  resources :shifts, except: [:show]
  get 'signup', to: 'users#new'
  resources :users, except: [:new, :index, :destroy, :show]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :organizations, except: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
