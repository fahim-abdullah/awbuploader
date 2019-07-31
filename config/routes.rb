Rails.application.routes.draw do
  resources :trip_files
  resources :records
  
  root to: 'records#new'
  
  get 'table' => 'records#table'
  
end
