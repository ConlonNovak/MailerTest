class UserMailer < ApplicationMailer

  default from: "hcofpghties@gmail.com"


  def pre_visit_email(user)
    @user = user
    @testURL = 'https://www.surveymonkey.com/r/ZXFV8R9?uuid=123456790'

    mail(to: @user.email, subject: "HCP Pre-Visit Survey Reminder")
  end

  def post_visit_email(user)
    @user = user
    @testURL = 'https://www.surveymonkey.com/r/ZXFV8R9?uuid=123456790'
    mail(to: @user.email, subject: "HCP Post-Visit Survey Reminder")
  end

end
