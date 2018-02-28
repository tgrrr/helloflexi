class AddSessionTypeIdToKlasses < ActiveRecord::Migration
  def change
    add_column :klasses, :session_type_id, :integer
  end
end
