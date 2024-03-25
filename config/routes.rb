Rails.application.routes.draw do
  namespace :admin do
      resources :admin_users
      resources :chapters
      resources :lines
      resources :links
      resources :poems
      resources :werds

      root to: "admin_users#index"
    end
  resources :lines
  resources :links, only: [:show]
  resources :chapters do
    member do
      get :next
      get :previous
    end
  end
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
  get 'awrad' => 'application#awrad'
  get 'awrad/:name' => 'application#show'
  get "mobile" =>  "application#mobile"
  get "privacy" =>  "application#privacy"
  root to: 'application#grid_home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
