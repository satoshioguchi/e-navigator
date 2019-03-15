class PagesController < ApplicationController
  
  def index
    if user_signed_in?
      @users = User.all
    else
      render 'top_page'
    end
  end
  
  def show
  end
  
  def profile_edit
  end
  
  def profile_update
    current_user.assign_attributes(account_update_params)
    if current_user.save
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
        :password_confirmation)
    end
    
    def account_update_params
      params.require(:user).permit(
        :username,
        :birthdate,
        :gender,
        :school,
        :email,
        :password,
        :password_confirmation)
    end
end
