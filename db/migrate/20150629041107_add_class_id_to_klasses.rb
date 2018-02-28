class AddClassIdToKlasses < ActiveRecord::Migration
  def change
    add_column :klasses, :class_id, :integer
  end
end
