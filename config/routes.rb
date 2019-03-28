Rails.application.routes.draw do
  root 'users#index', as: 'index'
  devise_for :users
  resources  :users, only: [:index, :edit, :update] do
    member do
      get :interviews
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
