class AddMonthlyClassVisitsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :monthly_class_visits, :integer
  end
end
