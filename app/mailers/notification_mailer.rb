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
  
  def interview_request(interviewer, user)
    @interviewer = interviewer
    @user = user
    mail(
    from:    'test@example.com',
    to:       @interviewer.email,
    subject: '面接希望日が決まりました'
    )
  end
end
