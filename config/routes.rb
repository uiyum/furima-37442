Rails.application.routes.draw do
  devise_for :users
  root 'sells#index' 

  resources :sells do
    resources :buys, only:[:index, :create]
  end

end

