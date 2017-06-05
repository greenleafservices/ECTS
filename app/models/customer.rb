class Customer < ApplicationRecord
  has_many :equipment
  has_many :csas, through: :equipment 
  
  def self.to_csv
    attributes = %w{id cust_id}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      
      all.each do |customer|
        csv << customer.attributes.values_at(*attributes)
      end
    end
  end
  
  def self.by_last_name
    order("last_name ASC")
  end  
end
