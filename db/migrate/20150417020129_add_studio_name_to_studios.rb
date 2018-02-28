class AddStudioNameToStudios < ActiveRecord::Migration
  def change
    add_column :studios, :studio_name, :string
  end
end
