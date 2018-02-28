class AddDidNotAttendToSignUps < ActiveRecord::Migration
  def change
    add_column :sign_ups, :did_not_attend, :boolean
  end
end
