Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'],
  :secret_key      => ENV['SECRET_KEY'],
  :customer_plan   => ENV['CUSTOMER_PLAN']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]