class InterviewsController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @interviews = Interview.where(user_id: params[:user_id])
  end
  
  def show
    @interview = Interview.find_by(user_id: params[:user_id], id: params[:id])
  end

  def new
    @interview = Interview.new
  end
  
  def create
    @interview = current_user.interviews.build(interview_params)
    @interview.propriety = 3
    if @interview.save
      redirect_to user_interviews_path
    else
      render :new
    end
  end

  def edit
    @interview = Interview.find_by(user_id: params[:user_id], id: params[:id])
  end
  
  def update
    @interview = Interview.find_by(user_id: current_user.id)
    if @interview.update_attributes(interview_params)
      flash[:success] = "面接が更新されました"
      redirect_to controller: 'interviews', action: 'show'
    else
      render edit
    end
  end
  
  def destroy
    @interview = Interview.find_by(user_id: params[:user_id], id: params[:id])
    @interview.destroy
    flash[:success] = "面接が削除されました"
    redirect_to controller: 'interviews', action: 'index'
  end
  
  private
  
    def interview_params
      params.require(:interview).permit(:schedule, :propriety)
    end
end
