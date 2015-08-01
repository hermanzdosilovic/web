Rails.application.routes.draw do
  devise_for :users

  root 'admin/posts#index'

  namespace :admin do
    root 'posts#index'
  end

end
