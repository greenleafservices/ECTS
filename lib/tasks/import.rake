namespace :import do
  
  desc "Import Customers from Access CSV"
  task customers: :environment do
    filename = File.join Rails.root, "C:\Users\JMS2\Documents\tblCustomer.csv"
    counter = 0
    
    CSV.foreach(filename, headers: true) do |row|
      p row
      p row["cust_id"]
      
    end
    puts "Imported #{counter} users"
    
  end
end