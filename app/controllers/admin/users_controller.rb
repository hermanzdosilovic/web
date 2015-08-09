module Admin
  class UsersController < Admin::AdminController
    before_action :load_user

    def edit_password
    end

    def update_password
      password = user_params[:password]
      password_confirmation = user_params[:password_confirmation]
      if @user.update_with_password(user_params) && password.present? && password == password_confirmation
        sign_in(@user, bypass: true)
        redirect_to admin_root_path
      else
        @user.errors[:password] << "can't be blank" if password.blank?
        @user.errors[:password_confirmation] << "doesn't match with Password" if password != password_confirmation
        render :edit_password
      end
    end

    def delete_account
      @user = current_user
    end

    private

    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation,
        :current_password
      )
    end

    def load_user
      @user = current_user
    end
  end
end
