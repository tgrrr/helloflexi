class CreateStudios < ActiveRecord::Migration
  def change
    create_table :studios do |t|
      t.string :source_name
      t.string :source_key
      t.references :user, index: true
      t.string :logo
      t.text :description

      t.timestamps null: false
    end
    add_foreign_key :studios, :users
  end
end
