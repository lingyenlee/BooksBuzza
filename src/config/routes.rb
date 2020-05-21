Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get "/pages/donated", to: "pages#donated"

  # allow router to use the session controller, include facebook callback
  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'} 

  devise_scope :user do
    get 'users/register', to: "users/sessions#register"
    get 'users/login', to: "users/sessions#login"

  end

  resources :listings 
  get "/:id/listings", to: "listings#user_listings", as: "user_listings" 

end
