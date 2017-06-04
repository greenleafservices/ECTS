class CreateEquipServiceCalls < ActiveRecord::Migration[5.0]
  def change
    create_table :equip_service_calls do |t|
      t.integer :call_id
      t.string :equip_id
      t.string :cust_id
      t.string :serial
      t.date :call_date
      t.text :call_notes
      t.references :equipment, foreign_key: true

      t.timestamps
    end
  end
end
