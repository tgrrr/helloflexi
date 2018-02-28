class AddCanceledAtToSignUps < ActiveRecord::Migration
  def change
    add_column :sign_ups, :canceled_at, :datetime
  end
end
