class UserMailer < ApplicationMailer

  default from: "cmuplayerreadiness@gmail.com"


  def pre_practice_email(user)
    @user = user
    @testURL = 'http://www.profh.net:8080'

    mail(to: @user.email, subject: "Pre-Practice Survey Reminder")
  end

  def post_practice_email(user)
    @user = user
    @testURL = 'http://www.profh.net:8080'
    mail(to: @user.email, subject: "Post-Practice Survey Reminder")
  end

end
