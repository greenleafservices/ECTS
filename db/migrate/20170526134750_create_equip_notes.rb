class CreateEquipNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :equip_notes do |t|
      t.string :cust_id
      t.string :equip_id
      t.text :equip_notes
      t.references :equipment, foreign_key: true

      t.timestamps
    end
  end
end
