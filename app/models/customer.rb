class Customer < ApplicationRecord
  has_many :equipment
  
  def self.to_csv
    attributes = %w{id cust_id}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      
      all.each do |customer|
        csv << customer.attributes.values_at(*attributes)
      end
    end
      
  end
end
