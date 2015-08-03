Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'admin/registrations' }

  root 'home#index'

  namespace :admin do
    root 'posts#index'
    as :user do
      get 'delete_account', controller: 'users', as: :delete_account
    end
  end
end
