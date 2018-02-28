class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :address_one, :city, :state, :country, :postal_code, :mobile, :preferred_location, :source, :agree_to_terms, :time_zone

  has_many :studios
  has_many :sign_ups
  has_many :mb_users

  validate :user_accepted_terms

  after_initialize :defaults

  def defaults
    self.paid ||= false
    self.monthly_class_visits ||= 0
  end

  def user_accepted_terms
    self.agree_to_terms
  end

end
