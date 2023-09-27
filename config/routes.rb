Rails.application.routes.draw do
  resources :posts
  resources :comments
  # Agrupar las rutas personalizadas para Devise
  devise_scope :user do
    get '/login', to: 'users/sessions#new', as: :login
    # Agregar aqu� otras rutas personalizadas de Devise si las tienes
  end
   devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  post "new_user_like", to: "likes#new_user_like"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end