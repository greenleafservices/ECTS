Rails.application.routes.draw do
  resources :equipment
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #get 'about-me', to: 'pages#about'
  
  get 'updateCust', to: 'equipment#updateCust'
  
end
