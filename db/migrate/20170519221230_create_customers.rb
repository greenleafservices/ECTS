class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :cust_id
      t.string :first_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :st
      t.string :zip
      t.string :home_phone
      t.string :work_phone
      t.string :cell_phone
      t.string :email
      t.boolean :auto_serv
      t.string :notes

      t.timestamps
    end
  end
end
