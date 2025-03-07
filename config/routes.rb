Rails.application.routes.draw do
  get "pages/home"
  root "pages#home"
  get "pages/about", to: "pages#about"
  resources :articles, only: [:show, :index, :new, :create]
end
