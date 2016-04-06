Rails.application.routes.draw do
  resources :bookstores do
    resources :reviews
  end
  resources :reviews do
    resources :comments
  end
  root 'bookstores#index'
end
