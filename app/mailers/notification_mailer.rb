class NotificationMailer < ApplicationMailer
  
  def interview_decision(user, interviewer, interview)
    @user = user
    @interviewer = interviewer
    @interview = interview
    mail(
    from:    'test@example.com',
    to:       "#{@user.email}, #{@interviewer.email}",
    subject: '面接日時が確定しました'
    )
  end
end
