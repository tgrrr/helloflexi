class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_if_paid, until: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :address_one, :address_two, :city, :state, :country, :postal_code, :mobile, :preferred_location, :source, :agree_to_terms, :paid, :coupon_code, :monthly_class_visits, :time_zone]
  end

  def after_sign_in_path_for(resource)
    classes_path
  end

  def check_if_paid
    unless params[:controller] == 'devise/sessions' && params[:action]=='destroy'
      #redirect_to new_charge_path if user_signed_in? && !current_user.paid
    end
  end
end
