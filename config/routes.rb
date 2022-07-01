Rails.application.routes.draw do
  devise_for :users
  root 'sells#index' 
  resources :sells, only: [:index, :new, :create, :show, :edit, :update] do
    resources :buys, only:[:index, :create]
  end

end
