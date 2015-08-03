Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'admin/users' }

  root 'home#index'

  namespace :admin do
    root 'posts#index'
  end
end
