class Equipment < ApplicationRecord
  belongs_to :customer
  
  def self.byCust
    order("cust_id DESC", "id ASC")
  end
end
