# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "/Users/aleclamusr/Desktop/67-373/S18/MailerTest/log/cron.log"
set :environment, 'development'

#
# every 3.minutes do
#   runner "User.email_all"
# end

job_type :qapla, "cd /Users/aleclamusr/Desktop/67-373/S18/MailerTest && rvm use 2.4.1 && :task :second && rails runner 'User.email_all' "

# every 3.minutes do
#   runner 'User.email_all'
# end

every 1.minute do
  qapla 'bundle', second: 'install'
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
