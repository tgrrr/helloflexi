class AddCanceledToSignUps < ActiveRecord::Migration
  def change
    add_column :sign_ups, :canceled, :boolean
  end
end
