class RegistrationsController < Devise::RegistrationsController
  before_action :upcase_coupon, only: [:create]

  def upcase_coupon
    params[:user][:coupon_code].downcase!
    puts params.inspect
  end
  protected
  def after_sign_up_path_for(resource)
    new_charge_path
  end
end
