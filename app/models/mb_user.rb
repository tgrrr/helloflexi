class MbUser < ActiveRecord::Base
	validates_presence_of :user_id, :studio_id, :mb_id
	belongs_to :user
	belongs_to :studio

	def self.create studio, user
		mb_id = MbApi::ClientService.create_user studio.site_ids, user
		super({mb_id: mb_id, studio_id: studio.id, user_id: user.id}) if mb_id
	end
end
