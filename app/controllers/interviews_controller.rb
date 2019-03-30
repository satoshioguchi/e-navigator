class InterviewsController < ApplicationController
  def index
     @user = User.find(params[:id])
     @interviews = Interview.where(user_id: params[:id])
  end

  def new
  end
  
  def create
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
end
