Rails.application.routes.draw do
  get "pages/home"
  root "pages#home"
  get "pages/about", to: "pages#about"
  resources :articles # , only: [:show, :index, :new, :create]
  get "signup", to: "users#new"
  resources :users, except: [:new]
end
