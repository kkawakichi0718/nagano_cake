Rails.application.routes.draw do
  devise_for :end_users
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'

  namespace :public do  	
  	root 'items#top'
    resources :end_users,only: [:show]
    resources :items,only: [:show]
  end

  namespace :admin do
  	root 'top#top'
  	resources :end_users
  end
end
