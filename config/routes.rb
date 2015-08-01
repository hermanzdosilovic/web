Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root 'posts#index'
  end

end
