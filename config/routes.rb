Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :admin do
    root to: 'banknotes#index'
    resources :banknotes
  end

  resources :withdrawals, only: %i(index create)
  root to: 'withdrawals#index'
end
