Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  resources :blogs do
  	member do
  		get :toggle_status
  	end
  end
  resources :portfolios
end
