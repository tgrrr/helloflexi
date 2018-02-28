class FixedReservedNameInCoupons < ActiveRecord::Migration
  def change
    remove_column :coupons, :valid
    add_column :coupons, :is_valid, :boolean
  end
end
