module Admin
  class RegistrationsController < Devise::RegistrationsController
    def new
      raise ActionController::RoutingError.new('Not Found')
    end

    def destroy
      if resource.valid_password?(params[:user][:password])
        render js: "window.location = '#{root_path}'"
      else
        resource.errors[:password] << "Incorrect password"
        render 'users/delete_account'
      end
    end
  end
end
