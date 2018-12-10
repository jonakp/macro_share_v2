Rails.application.routes.draw do
  resources :foodhistories
  resources :userfeatures
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users
  get "/users/:id/on/:year/:month/:day" => "users#show"
  resources :likes, only: [:create, :destroy]
  resources :foodhistory_images, only: [:destroy]
  root "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
