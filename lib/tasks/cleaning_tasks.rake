namespace :cleaning_tasks do

  desc "Reset the monthly visit count on the first day of each month"

  task reset_monthly_visit_count: :environment do
    if Date.today.day == 1
      User.all.each do |user|
        user.update(monthly_class_visits: 0)
      end
    end
  end
end