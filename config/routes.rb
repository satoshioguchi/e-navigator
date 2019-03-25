Rails.application.routes.draw do
  root 'pages#index', as: 'index'
  devise_for :users
  resources  :users, only: [:index, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
