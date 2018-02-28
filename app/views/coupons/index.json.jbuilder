json.array!(@coupons) do |coupon|
  json.extract! coupon, :id, :code, :percent_off, :amount_off, :currency, :object_name, :duration, :livemode, :redeem_by, :max_redemptions, :times_redeemed, :duration_in_months, :is_valid
  json.url coupon_url(coupon, format: :json)
end
