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
# Customer id: 16
# Equipment id: 40, customer_id: 16, csa_id: 2>
# Csa id: 2,  equipment_id: 40

namespace :fixCSA_IDS do
   task doFix:  :environment do
    # @equipment = Equipment.all 
    @equipment = Equipment.where("NOT csa1 IS NULL") 
    @equipment.each do |e|
      # Find the CSA matching record
      @csa = Csa.where(csa: e.csa1)
      # Load the variable
      csaid = @csa.first.id
      # Write the variable to the equipment record
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

# @s.each do |s|
# 2.4.0 :020 >     s.equipment_id = 35                                                             
# 2.4.0 :021?>   s.save
# 2.4.0 :022?>   end

# 2.4.0 :030 > e.csa_id = 1
# => 1 
# 2.4.0 :031 > e.save

# c = Customer.find(14)
# c.equipment
# c.csas
 
