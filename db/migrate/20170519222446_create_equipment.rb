class CreateEquipment < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment do |t|
      t.string :cust_id
      t.string :equip_id
      t.string :csa1
      t.string :serial
      t.string :model
      t.string :manufacturer
      t.string :product_type
      t.date :date_installed
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
