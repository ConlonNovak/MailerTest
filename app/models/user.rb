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
    # array of 30 minutes past practice end times for women's tennis
    # parameters for DateTime object are year, month, day, hour, minute
    # .change sets the DateTime object in our time zone (US Eastern)
    practice_times = [
      DateTime.new(2018, 2, 12, 23).change(:offset => "-0500"),
      DateTime.new(2018, 2, 13, 18, 30).change(:offset => "-0500"),
      DateTime.new(2018, 2, 14, 23).change(:offset => "-0500"),
      DateTime.new(2018, 2, 15,  8, 30).change(:offset => "-0500"),
      DateTime.new(2018, 2, 19, 23).change(:offset => "-0500"),
      DateTime.new(2018, 2, 20, 18, 30).change(:offset => "-0500"),
      DateTime.new(2018, 2, 21, 23).change(:offset => "-0500"),
      DateTime.new(2018, 2, 22, 23).change(:offset => "-0500"),
      DateTime.new(2018, 2, 24,  9, 30).change(:offset => "-0500"),
      DateTime.new(2018, 2, 26, 23).change(:offset => "-0500"),
      DateTime.new(2018, 2, 27, 23).change(:offset => "-0500"),
      DateTime.new(2018, 3,  7, 23).change(:offset => "-0500")
    ]
    User.all.each do |u|
      # check if they are on women's tennis team
      if u.team_id == 9
        # check if current date is close (+/- 10 min) to one of the practice end times
        practice_times.each do |t|
          if ((DateTime.now - t) * 24 * 60).to_i > (-10) && ((DateTime.now - t) * 24 * 60).to_i < 10
            UserMailer.post_practice_email(u).deliver_now
            break
          end
        end
      end
    end
  end

  # Men's Tennis 8
  def self.email_mtennis
    # array of 30 minutes past practice end times for men's tennis
    # parameters for DateTime object are year, month, day, hour, minute
    # .change sets the DateTime object in our time zone (US Eastern)
    practice_times = [
      DateTime.new(2018, 2, 8, 18, 30).change(:offset => "-0500"),
      DateTime.new(2018, 2, 8, 18, 35).change(:offset => "-0500")
      # DateTime.new(2018, 2, 14, 19, 30).change(:offset => "-0500"),
      # DateTime.new(2018, 2, 15, 23).change(:offset => "-0500"),  
      # DateTime.new(2018, 2, 18, 10, 30).change(:offset => "-0500"),  
      # DateTime.new(2018, 2, 19, 23).change(:offset => "-0500"),
      # DateTime.new(2018, 2, 20, 23).change(:offset => "-0500"),  
      # DateTime.new(2018, 2, 28, 23).change(:offset => "-0500"),
      # DateTime.new(2018, 3,  1, 23).change(:offset => "-0500"),  
      # DateTime.new(2018, 3,  3,  9, 30).change(:offset => "-0500"),  
      # DateTime.new(2018, 3,  5, 23).change(:offset => "-0500"),
      # DateTime.new(2018, 3,  6, 23).change(:offset => "-0500")
    ]
    User.all.each do |u|
      # check if they are on men's tennis team
      if u.id % 2 == 1
        # check if current date is close (+/- 10 min) to one of the practice end times
        practice_times.each do |t|
          if ((DateTime.now - t) * 24 * 60).to_i > (-2) && ((DateTime.now - t) * 24 * 60).to_i < 2
            UserMailer.post_practice_email(u).deliver_now
            break
          end
        end
      end
    end
  end

  def self.testMethod
    puts User.all
  end

end
