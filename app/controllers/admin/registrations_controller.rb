module Admin
  class RegistrationsController < Devise::RegistrationsController
    def destroy
      if resource.valid_password?(params[:user][:password])
        redirect_to root_path
      else
        resource.errors[:password] << "Incorrect password"
        render 'users/delete_account'
      end
    end
  end
end
