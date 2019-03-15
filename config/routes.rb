Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'users/:id/edit', to: 'pages#profile_edit', as: 'profile_edit'
    get 'index', to: 'pages#index', as: 'index'
    patch 'profile_update', to: 'pages#profile_update', as: 'profile_update'
    root :to => "pages#index"
  end
  get 'pages/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
