Rails.application.routes.draw do
  resources :records
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'records#new'
  
  get 'table' => 'records#table'


  namespace :records do
  	post :batch_download
  end

  
end
