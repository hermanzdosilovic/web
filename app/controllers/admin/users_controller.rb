module Admin
  class UsersController < Devise::RegistrationsController
    def update
      if params[:commit] == 'Update'
        super
      elsif User.find_by_email(params[:user][:email]).valid_password?(params[:user][:current_password])
        destroy
      else
        super
      end
    end
  end
end
