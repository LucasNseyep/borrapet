Rails.application.routes.draw do
  get 'play_dates/create'
  get 'play_dates/index'
  # get 'pets/index'
  # get 'pets/new'
  # get 'pets/create'
  # get 'pets/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :pets do
    resources :play_dates
  end
  resources :user do
    resources :play_dates
  end
end
