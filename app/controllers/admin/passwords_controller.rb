module Admin
  class PasswordsController < Devise::PasswordsController
    prepend_before_filter :require_no_authentication, only: [:edit, :update]

    # GET /resource/password/new
    def new
      self.resource = current_user || resource_class.new
    end
  end
end
