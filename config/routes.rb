Rails.application.routes.draw do
  namespace :admin do
    root to: 'banknotes#index'
    
    resources :banknotes
  end

  root to: 'home#index'
  post 'withdrawal', to: 'home#withdrawal'
end
