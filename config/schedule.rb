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

every 24.hours do
  runner "Student.update_grades"
  runner "Student.update_percentages"
  runner "Student.update_total_answers"
  runner "Student.update_correct_answers"
end

every 24.hours do
  runner "Student.update_leaderboard"
end

# every :friday, :at => '5pm' do
#   runner "Student.weekly_update"
# end
