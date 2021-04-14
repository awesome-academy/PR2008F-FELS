Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users,
  controllers:{omniauth_callbacks: "users/omniauth_callbacks"}
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/help'
  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end
  resources :categories
  resources :words
  resources :lessons
end
