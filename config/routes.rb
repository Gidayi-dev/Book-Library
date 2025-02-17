
Rails.application.routes.draw do
  resources :books do
    resources :lending_histories, only: [:new, :create]
    member do
      patch 'return', to: 'books#return'
    end
  end
  root "books#index"
end
