Rails.application.routes.draw do

  root 'bookstores#index'
  
  devise_for :users

  resources :bookstores

end
