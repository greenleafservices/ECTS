class CreateEquipWarrantyNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :equip_warranty_notes do |t|
      t.string :equip_id
      t.string :cust_id
      t.text :warranty_notes
      t.references :equipment, foreign_key: true

      t.timestamps
    end
  end
end
