Rails.application.routes.draw do
  devise_for :users
  root 'sells#index' 
  resources :sells
end