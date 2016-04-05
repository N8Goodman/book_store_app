Rails.application.routes.draw do
  resources :bookstores
  root 'bookstores#index'
end
