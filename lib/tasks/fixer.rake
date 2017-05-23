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

namespace :fixCSA_IDS do
   task doFix:  :environment do
     @equipment = Equipment.where("NOT csa1 IS NULL")
     @equipment.each do |e|
      # @csa = Csa.where(cust_id: e.cust_id.to_i)
      @csa = Csa.where(csa: e.csa1)
      csaid = @csa.first.id
      e.csa_id = csaid
      e.save  
    end
  end
end
 
namespace :testFix do
  task :test2 do
    puts "My task PWD = #{'pwd'}"
  end
end