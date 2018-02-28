class AddIsCanceledToKlasses < ActiveRecord::Migration
  def change
    add_column :klasses, :is_canceled, :string
  end
end
