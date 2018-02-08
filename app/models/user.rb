class User < ApplicationRecord

  # Daily Wellness Survey @ 10 AM everyday
  def self.email_all
    User.all.each do |u|
      UserMailer.pre_practice_email(u).deliver_now
    end
  end


  # Men's Basketball 5 @ 7PM
  def self.email_mbb
    User.all.each do |u|
      if u.team_id == 5
        UserMailer.post_practice_email(u).deliver_now
      end
    end
  end

  # Women's Basketball 6 @ 7PM
  def self.email_wbb
    User.all.each do |u|
      if u.team_id == 6
        UserMailer.post_practice_email(u).deliver_now
      end
    end
  end

  # Women's Tennis 9
  def self.email_wtennis
    User.all.each do |u|
      if u.team_id == 9
        UserMailer.post_practice_email(u).deliver_now
      end
    end
  end

  # Men's Tennis 8
  def self.email_mtennis
    User.all.each do |u|
      if u.team_id == 8
        UserMailer.post_practice_email(u).deliver_now
      end
    end
  end

  def self.testMethod
    puts User.all
  end

end
