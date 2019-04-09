Rails.application.routes.draw do
  resources :lines
  resources :chapters
  resources :poems do
    member do
      get :poem_quick_view
    end
  end
  root to: 'application#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
