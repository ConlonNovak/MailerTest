set :output, "/Users/aleclamusr/Desktop/67-373/S18/MailerTest/log/cron.log"
set :environment, 'development'


job_type :all, "cd /Users/aleclamusr/Desktop/67-373/S18/MailerTest && rvm use 2.4.1 && :task :second && rails runner 'User.email_all' "
job_type :mbb, "cd /Users/aleclamusr/Desktop/67-373/S18/MailerTest && rvm use 2.4.1 && :task :second && rails runner 'User.email_mbb' "
job_type :wbb, "cd /Users/aleclamusr/Desktop/67-373/S18/MailerTest && rvm use 2.4.1 && :task :second && rails runner 'User.email_wbb' "
job_type :mtennis, "cd /Users/aleclamusr/Desktop/67-373/S18/MailerTest && rvm use 2.4.1 && :task :second && rails runner 'User.email_mtennis' "
job_type :wtennis, "cd /Users/aleclamusr/Desktop/67-373/S18/MailerTest && rvm use 2.4.1 && :task :second && rails runner 'User.email_wtennis' "

every 1.day, at: '10:00 am' do
  all 'bundle', second: 'install'
end