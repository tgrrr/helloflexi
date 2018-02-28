namespace :mb do
  desc "Calls the MINDBODY API"
  task classes: :environment do
    puts "start fetching classes..."
    start_date = Date.today.beginning_of_week.strftime
    end_date = (Date.today.end_of_week + 7).strftime
    Klass.load start_date, end_date
    puts "done"
  end
end