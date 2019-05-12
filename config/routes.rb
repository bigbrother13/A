Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :admin do
    root to: 'banknotes#index'
    
    resources :banknotes
  end

  get '/', to: 'home#index', as: :home
  post 'withdrawal', to: 'home#withdrawal'

  root to: 'home#index'
end
