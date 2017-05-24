class Csa < ApplicationRecord
  has_many :equipment
  has_many :customers, through: :equipment
  
  def self.by_CSA
    order("id ASC")
  end
end
