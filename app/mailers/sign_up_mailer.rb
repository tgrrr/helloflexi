class SignUpMailer < ApplicationMailer
  default from: "do-not-reply@helloflexi.com"
 
  def sign_up_email(sign_up)
    @sign_up = sign_up
    mail(to: "test@tgrrr.com", subject: 'User Class Sign Up')
  end
end
