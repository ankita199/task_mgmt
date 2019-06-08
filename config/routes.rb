Rails.application.routes.draw do
  resources :tasks do
    resources :comments
  end
  devise_for :users
   root to: 'projects#index'
   resources :projects
  
  authenticated :user do
    root 'projects#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
