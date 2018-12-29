Rails.application.routes.draw do
  resources :notifications, only: [:index, :show]
  resources :foodhistories
  resources :userfeatures, only: [:index, :show, :destroy]
  resources :userfeature_forms, only: [:new, :edit, :create, :update]
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users
  get "/users/:id/on/:year/:month/:day" => "users#show"
  resources :likes, only: [:create, :destroy]
  resources :foodhistory_images, only: [:destroy]
  root "users#index"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
