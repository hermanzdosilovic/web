module Admin
  class RegistrationsController < Devise::RegistrationsController
    layout 'admin'

    def new
      raise ActionController::RoutingError.new('Not Found')
    end

    def destroy
      if resource.valid_password?(params[:user][:password])
        resource.destroy
        Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
        render js: "window.location = '#{root_path}'"
      else
        resource.errors[:password] << 'Incorrect password'
        render 'admin/users/delete_account'
      end
    end

    protected

    def update_resource(resource, params)
      resource.update_without_password(params)
    end
  end
end
