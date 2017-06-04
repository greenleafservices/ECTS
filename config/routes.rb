Rails.application.routes.draw do
  resources :equip_service_calls
  resources :equip_warranty_notes
  resources :equip_notes
  resources :csas
  resources :equipment
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #get 'about-me', to: 'pages#about'
  
  get 'updateCust', to: 'equipment#updateCust'
  
end
