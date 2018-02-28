class AddApiParamsToKlass < ActiveRecord::Migration
  def change
    add_column :klasses, :can_book, :string
    add_column :klasses, :max_capacity, :string
    add_column :klasses, :web_capacity, :string
    add_column :klasses, :total_booked, :string
    add_column :klasses, :address, :string
    add_column :klasses, :city, :string
    add_column :klasses, :state_prov_code, :string
    add_column :klasses, :postal_code, :string
    add_column :klasses, :latitude, :string
    add_column :klasses, :longitude, :string
    add_column :klasses, :business_description, :text
    add_column :klasses, :location_name, :string
    add_column :klasses, :level, :string
    add_column :klasses, :class_description, :text
    add_column :klasses, :class_type, :string
    add_column :klasses, :session_type_name, :string
    add_column :klasses, :staff_name, :string
    add_column :klasses, :staff_bio, :string
    add_column :klasses, :staff_avatar, :string
  end
end
