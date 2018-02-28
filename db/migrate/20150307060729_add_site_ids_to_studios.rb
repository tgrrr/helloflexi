class AddSiteIdsToStudios < ActiveRecord::Migration
  def change
    add_column :studios, :site_ids, :integer
  end
end
