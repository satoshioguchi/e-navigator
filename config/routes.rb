Rails.application.routes.draw do
  root 'pages#index', as: 'index'
  devise_for :users
  get 'users/:id/edit', to: 'pages#profile_edit', as: 'profile_edit'
  patch 'profile_update', to: 'pages#profile_update', as: 'profile_update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
