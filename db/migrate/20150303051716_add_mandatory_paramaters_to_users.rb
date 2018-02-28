class AddMandatoryParamatersToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address_one, :string
    add_column :users, :address_two, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :postal_code, :string
    add_column :users, :mobile, :string
    add_column :users, :preferred_location, :string
    add_column :users, :source, :text
    add_column :users, :agree_to_terms, :boolean
  end
end
