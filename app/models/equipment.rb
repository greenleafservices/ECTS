class Equipment < ApplicationRecord
  belongs_to :customer
  belongs_to :csa
  has_many :equip_note
  has_many :equip_warranty_note
  
  def self.byCust
    order("cust_id DESC", "id ASC")
  end
end
