Rails.application.routes.draw do
  devise_for :users
  root 'sells#index' 
  resources :sells, only: [:index, :new, :create, :show, :edit, :update]
end
