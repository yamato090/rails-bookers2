Rails.application.routes.draw do
  devise_for :users
  root "homes#top"
  
  get "/home/about" => "homes#about"
  resources :users
  resources :books
  resources :book_commen, only: [:create, :destroy]
end


