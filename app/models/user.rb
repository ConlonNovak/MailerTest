class User < ApplicationRecord

  def self.email_all
    User.all.each do |u|
      UserMailer.pre_practice_email(u).deliver_now
      #UserMailer.post_practice_email(u).deliver_now
    end
  end

  def self.testMethod
    puts User.all
  end

end
