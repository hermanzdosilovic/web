Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'admin/registrations', passwords: 'admin/passwords' }

  root 'preview/home#index'

  scope :users, controller: 'admin/users' do
    get :edit_password
    patch :edit_password, to: :update_password
    get :delete_account
  end

  namespace :admin do
    root 'posts#index'
  end
end
