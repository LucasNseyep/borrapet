Rails.application.routes.draw do
  # get 'reviews/index'
  # get 'reviews/create'
  # get 'reviews/new'
  # # get 'play_dates/create'
  # # get 'play_dates/index'
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
  resources :play_dates do
    resources :reviews, only: [:create, :new]
  end
  resources :user do
    resources :play_dates
      # resources :reviews, only: [:create, :new]
  end
end
