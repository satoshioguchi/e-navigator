class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if current_user.update(account_update_params)
      flash[:success] = "保存しました"
      redirect_to action: :index
    else
      render "edit"
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
