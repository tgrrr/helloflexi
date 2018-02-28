class CreateKlasses < ActiveRecord::Migration
  def change
    create_table :klasses do |t|
      t.string :title
      t.boolean :all_day
      t.datetime :start_timestamp
      t.datetime :end_timestamp
      t.references :studio, index: true

      t.timestamps null: false
    end
    add_foreign_key :klasses, :studios
  end
end
