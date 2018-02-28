class CreateSignUps < ActiveRecord::Migration
  def change
    create_table :sign_ups do |t|
      t.references :klass, index: true
      t.references :user, index: true
      t.boolean :attended

      t.timestamps null: false
    end
    add_foreign_key :sign_ups, :klasses
    add_foreign_key :sign_ups, :users
  end
end
