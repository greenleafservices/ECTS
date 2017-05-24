class Equipment < ApplicationRecord
  # belongs_to :customer
  # belongs_to :csa
  
  def self.byCust
    order("cust_id DESC", "id ASC")
  end
end
