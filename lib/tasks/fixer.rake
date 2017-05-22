namespace :fixEquip_IDS do
  task doFix:  :environment do
    @equipment = Equipment.all
    @equipment.each do |e|
      @customer = Customer.where(cust_id: e.cust_id.to_i)
      ccid = @customer.first.id
      e.customer_id = ccid
      e.save  
    end
  end
end

namespace :fixTest_IDS do
  # task doFix:  :environment do
  #   @equipment = Equipment.all
  #   @equipment.each do |e|
  #     @customer = Customer.where(cust_id: e.cust_id.to_i)
  #     ccid = @customer.first.id
  #     e.customer_id = ccid
  #     e.save  
  #   end
  # end
  task :test2 do
    puts "My task PWD = #{'pwd'}"
  end
end