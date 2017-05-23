class RenameColumn < ActiveRecord::Migration[5.0]
  def change
   
    rename_column :equipment, :csa, :csa1
  
  end
end
