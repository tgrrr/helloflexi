class CreateBlacklists < ActiveRecord::Migration
  def change
    create_table :blacklists do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :klass, index: true

      t.timestamps null: false
    end
    add_foreign_key :blacklists, :klasses
  end
end
