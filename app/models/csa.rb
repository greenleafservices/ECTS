class Csa < ApplicationRecord
  belongs_to :equipment
  has_many :customers, through: :equipment
  
  def self.by_CSA
    order("id ASC")
  end
end
