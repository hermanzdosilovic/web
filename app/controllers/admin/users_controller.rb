module Admin
  class UsersController < Admin::AdminController
    def delete_account
      @user = current_user
    end
  end
end
