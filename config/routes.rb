Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers:{omniauth_callbacks: "users/omniauth_callbacks"}

  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/help'

  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
    get "signup" => "devise/registrations#new"
    get "edit" => "devise/registrations#edit"
  end

  get 'profile', to: 'users#show'

  get 'search', to: 'categories#search'

  namespace :admin do
    resources :words
    resources :categories
    resources :lessons
  end

  resources :words
  resources :lessons

  resource :user do
    resources :results, only: :index
  end

  get 'profile/results' => 'results#index'

end
