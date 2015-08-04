Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'admin/registrations', passwords: 'admin/passwords' }
  scope :users do
    get 'delete_account', controller: 'users', as: :delete_account
  end

  root 'home#index'

  namespace :admin do
    root 'posts#index'
  end
end
