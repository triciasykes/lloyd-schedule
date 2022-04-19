Rails.application.routes.draw do
  
  root to: 'work_orders#index'

  resources :work_orders
  resources :technicians
  resources :locations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
