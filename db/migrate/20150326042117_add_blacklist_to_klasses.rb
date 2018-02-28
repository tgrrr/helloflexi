class AddBlacklistToKlasses < ActiveRecord::Migration
  def change
    add_column :klasses, :blacklist, :boolean
  end
end
