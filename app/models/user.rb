class User < ApplicationRecord

  # Daily Wellness Survey @ 10 AM everyday
  def self.email_all
    User.all.each do |u|
      UserMailer.pre_practice_email(u).deliver_now
      #UserMailer.post_practice_email(u).deliver_now
    end
  end


  # Men's Basketball 5

  # Women's Basketball 6


  # Women's Tennis 9


  # Men's Tennis 8


  def self.testMethod
    puts User.all
  end

end
