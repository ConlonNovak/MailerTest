class User < ApplicationRecord

  def self.email_all
    User.all.each do |u|

      if (u.id % 2 == 1)
        UserMailer.post_practice_email(u).deliver_now
      end
      if (u.id % 2 == 0)
        UserMailer.pre_practice_email(u).deliver_now
      end
      #UserMailer.post_practice_email(u).deliver_now
    end
  end

  def self.testMethod
    puts User.all
  end

end
