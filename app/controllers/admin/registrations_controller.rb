module Admin
  class RegistrationsController < Devise::RegistrationsController
    def destroy
      if resource.valid_password?(params[:user][:password])
        super
      else
        resource.errors[:password] << "Incorrect password"
        render 'admin/users/delete_account'
      end
    end
  end
end
