Rails.application.routes.draw do
  devise_for :end_users, :controllers => {
   :registrations => 'public/registrations',
   :sessions => 'public/sessions',
   :passwords => 'public/passwords'
  }
  devise_for :admin, :controllers => {
   :registrations => 'admin/registrations',
   :sessions => 'admin/sessions',
   :passwords => 'admin/passwords'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'

  namespace :public do  	
  	root 'items#top'
    resource :end_user, only: [:show, :edit]
    patch "/end_user" => "end_users#update"
    resources :items,only: [:show, :index]
    get "end_user/confirm" => "end_users#confirm"
    put "/end_user" => "end_users#withdrawal", as: 'end_user_withdrawal'
  end

  namespace :admin do
  	root 'top#top'
  	resources :end_users, only: [:index]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items
  end
end
