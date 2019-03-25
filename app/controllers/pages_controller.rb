class PagesController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def profile_edit
  end
  
  def profile_update
    if current_user.update_attributes(account_update_params)
      redirect_to action: :index
    else
      render "profile_edit"
    end
  end
  
  private
    def sign_up_params
      params.require(:user).permit(
        :email,
        :password,
        :password_confirmation,
        )
    end
    
    def account_update_params
      params.require(:user).permit(
        :username,
        :birthdate,
        :gender,
        :school,
        :email,
        :password,
        :password_confirmation,
        )
    end
end
