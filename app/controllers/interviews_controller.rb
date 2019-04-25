class InterviewsController < ApplicationController
  
  def index
    @except_current_user = User.where.not(id: current_user.id)
    @user = User.find(params[:user_id])
    @interviews = @user.interviews
    @approval_interview = Interview.where(user_id: params[:user_id]).find_by(propriety: 2)
    if current_user.id != @user.id
      render "other_user_interview_schedule"
    end
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
    @interview = Interview.find_by(user_id: params[:user_id], id: params[:id])
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
  
  def approve
    @user = User.find(params[:user_id])
    @interviewer = User.find(current_user.id)
    @interviews = Interview.where(user_id: params[:user_id])
    @interview = Interview.find_by(user_id: params[:user_id], id: params[:interview_id])
    if @interview.schedule > DateTime.now && @interview.update_attributes(propriety: 2)
      NotificationMailer.interview_decision(@user, @interviewer, @interview).deliver
      @interviews.each do |interview|
        if @interview != interview
          interview.update_attributes(propriety: 1)
        end
      end
      flash[:success] = "面接が更新されました"
      redirect_to controller: 'interviews', action: 'show', user_id: params[:user_id], id: params[:interview_id]
    else
      flash[:danger] = "開始時間は未来の時間を指定してください"
      redirect_to controller: 'interviews', action: 'edit', user_id: params[:user_id], id: params[:interview_id]
    end
  end
  
  def apply
    @interviewer = User.find(params[:request_user][:request_user])
    @user = User.find(current_user.id)
    NotificationMailer.interview_request(@interviewer, @user).deliver
    flash[:success] = "申請が完了しました"
    redirect_to action: 'index', user_id: current_user.id
  end
  
  private
  
    def interview_params
      params.require(:interview).permit(:schedule, :propriety)
    end
end
