class CreateLodgings < ActiveRecord::Migration[5.2]
  def change
    create_table :lodgings do |t|
      t.references :city, foreign_key: true
      t.integer :available_beds
      t.integer :price
      t.text :description
      t.boolean :has_wifi
      t.text :welcome_message
      t.references :administrator, index: true

      t.timestamps
    end
  end
end
