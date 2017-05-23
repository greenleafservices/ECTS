class AddCustomerReferenceToCsas < ActiveRecord::Migration[5.0]
  def change
    add_reference :csas, :customer, foreign_key: true
  end
end
