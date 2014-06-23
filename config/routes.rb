Rails.application.routes.draw do
  get 'sessions/new'

  root 'pages#main'

  resources :media
  resources :articles, only: [:index, :show]
  resources :contacts, only: :create

  namespace :admin do
    resources :articles, except: :show
  end

  [:contact].each do |page|
    get "pages/#{page}" => "pages##{page}", as: page
  end
  resources :sessions, only: [:new, :create, :destroy]
  get 'login' => 'sessions#new', as: :login
  delete 'logout' => 'sessions#destroy', as: :logout
  get 'admin' => 'admin/articles#index', as: :admin
end
