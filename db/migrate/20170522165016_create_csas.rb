class CreateCsas < ActiveRecord::Migration[5.0]
  def change
    create_table :csas do |t|
      t.string :cust_id
      t.string :csa
      t.string :equip_id
      t.date :start_date
      t.date :end_date
      t.integer :term
      t.string :equip_desc
      t.decimal :total_perks
      t.references :equipment, foreign_key: true

      t.timestamps
    end
  end
end
