class CreateFirms < ActiveRecord::Migration
  def change
    create_table :firms do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
