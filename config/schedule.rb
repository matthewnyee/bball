# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
###########################################################################
#set :environment, "development"

every 1.minute do
  runner "User.update_all(status => :schedule_rb_file_withwheneverize)"
end
###########################################################################

# job_type :awesome, '/usr/local/bin/awesome :task :fun_level'
#
# every 2.hours do
#   awesome "party", :fun_level => "extreme"
# end
