class Studio < ActiveRecord::Base
  belongs_to :user

  has_many :klasses
  has_many :mb_users

  validates_presence_of :user_id, :site_ids
  validates_uniqueness_of :site_ids

end
