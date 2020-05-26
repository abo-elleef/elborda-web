Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :lines
  resources :chapters
  resources :poems do
    collection do
      get :search
    end
    member do
      get :next
      get :previous
      get :poem_quick_view
    end
  end
  get "mobile" =>  "application#mobile"
  root to: 'application#grid_home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
