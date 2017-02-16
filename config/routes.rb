Rails.application.routes.draw do
  resources :registered_applications 

  devise_for :users

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
