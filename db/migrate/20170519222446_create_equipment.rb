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
      t.date   :date_installed
      t.date   :last_service_date
      t.integer :recommended_service
      t.date   :next_service_date
      t.text   :equipment_notes
      tstring   :warranty_policy
      t.integer :extended
      t.string  :warranty_length
      t.string  :warranty_type
      t.date    :expiration_date
      t.text    :warranty_notes
      t.integer :hide
      t.references :customer, foreign_key: true
      t.references :csas, foreign_key: true
      
      t.timestamps
    end
  end
end
