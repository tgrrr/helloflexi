class SignUp < ActiveRecord::Base
  belongs_to :klass
  belongs_to :user
end
