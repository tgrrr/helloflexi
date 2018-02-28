class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :code
      t.integer :percent_off
      t.decimal :amount_off
      t.string :currency
      t.string :object_name
      t.string :duration
      t.boolean :livemode
      t.datetime :redeem_by
      t.integer :max_redemptions
      t.integer :times_redeemed
      t.integer :duration_in_months
      t.boolean :valid

      t.timestamps null: false
    end
  end
end
