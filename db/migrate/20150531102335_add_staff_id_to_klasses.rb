class AddStaffIdToKlasses < ActiveRecord::Migration
  def change
    add_column :klasses, :staff_id, :integer
  end
end
