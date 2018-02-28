class AddLocationIdToKlasses < ActiveRecord::Migration
  def change
    add_column :klasses, :location_id, :integer
  end
end
