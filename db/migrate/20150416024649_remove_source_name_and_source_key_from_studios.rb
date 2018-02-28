class RemoveSourceNameAndSourceKeyFromStudios < ActiveRecord::Migration
  def change
    remove_column :studios, :source_name, :string
    remove_column :studios, :source_key, :string
  end
end
