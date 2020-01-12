Rails.application.routes.draw do
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
  root to: 'application#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
