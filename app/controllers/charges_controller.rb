class ChargesController < ApplicationController
  after_action :is_received_payment, only: :create
  skip_before_action :check_if_paid

  def new
    @amount = 11800
    @stripe_pk = Rails.configuration.stripe[:publishable_key]
    if current_user.coupon_code.present?
      begin
        user_coupon = Stripe::Coupon.retrieve(current_user.coupon_code.downcase)
        if user_coupon.percent_off.present?
          @amount = @amount - @amount * user_coupon.percent_off / 100
        elsif user_coupon.amount_off.present?
          @amount = @amount - user_coupon.amount_off
        end
      rescue =>e
      end
    end

  end

  def create
    # Amount in cents

    @amount = 11800

    token = params[:stripeToken]
    if current_user.coupon_code
      customer = Stripe::Customer.create(
        :source => token,
        :plan => Rails.configuration.stripe[:customer_plan],
        :email => current_user.email,
        :coupon => current_user.coupon_code.presence || nil
      )
    else
      customer = Stripe::Customer.create(
        :source => token,
        :plan => Rails.configuration.stripe[:customer_plan],
        :email => current_user.email
      )
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to classes_path
  end
  private
  def is_received_payment
    current_user.update_attributes paid: true  if current_user.present?
    #redirect_to classes_path
  end
end
