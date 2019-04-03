class InterviewsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @interviews = Interview.where(user_id: params[:id])
  end

  def new
    @interview = Interview.new
  end
  
  def create
    @interview = current_user.interviews.build(interview_params)
    @interview.propriety = 3
    if @interview.save
      redirect_to interviews_path
    else
      render :new
    end
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
    def interview_params
      params.require(:interview).permit(:schedule, :propriety)
    end
end
