Rails.application.routes.draw do
  namespace :admin do
  	root to: 'main#index'
  	
    get 'main/index'
  end

  root 'stories#index'
  resources :stories
end
