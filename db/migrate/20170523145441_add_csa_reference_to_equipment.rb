class AddCsaReferenceToEquipment < ActiveRecord::Migration[5.0]
  def change
    add_reference :equipment, :csa, foreign_key: true
  end
end
