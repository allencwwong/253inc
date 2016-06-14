Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
  authenticated :user do
    root 'sales#index', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end
  
  post 'quotes/change-status', to: 'quotes#change_status'

  resources :inventories
  resources :sales
  resources :quotes
end
