Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  resources :blogs

  resources :blacklists

  resources :coupons

  resources :sign_ups do
    post 'penalize'

    member do
      put 'cancel'
    end
  end

  # Routes for studios
  resources :studios
  get "studio-dashboard/:id", to: 'studios#dashboard'

  # Routes for charges
  resources :charges

  # Routes for klasses
  resources :klasses, except: [:new]

  # Billing history routes
  get 'billing-history' => 'billing_history#index'

  # User routes
  devise_for :users, :controllers => { registrations:  "registrations" }
  devise_scope :user do
    get "/login" => "devise/sessions#new"
    get "/register" => "devise/registrations#new"
  end

  # Page routes

  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'faqs', to: 'pages#faqs'
  get 'my-classes', to: 'pages#my_classes'
  get 'classes', to: 'pages#classes'
  get 'classes/nextweek', to: 'pages#nextweek_classes'
# Different in merge 13 July 2015 
  post 'classes/sign_up', to: 'pages#sign_up', as: 'signup_klasses'
  post 'classes/cancel', to: 'pages#cancel', as: 'cancel_klasses'
  get 'toc', to: 'pages#toc'
  get 'privacy', to: 'pages#privacy'

  # Homepage route
  root to: "pages#home"
end
