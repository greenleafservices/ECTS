namespace :fixEquip_IDS do
  task doFix:  :environment do
    $e_count = 1
    # @equipment = Equipment.all
    @equipment = Equipment.where("NOT cust_id ='8414'")
    @equipment.each do |e|
      puts "e_count = #{$e_count}"
      puts "e_cust_id = #{e.cust_id}"
      #Find the customer with the old cust_id in the Customer file
      @customer = Customer.where(cust_id: e.cust_id.to_i)
      #Get the new customer id for this customer
      $ccid = @customer.first.id
      #Write the new id for the customer
      e.customer_id = $ccid
      e.save 
      $e_count = $e_count +1
      puts "New e_count = #{$e_count}"
      puts "New_cust_id = #{$ccid}"
    end
  end
end
# Customer id: 16
# Equipment id: 40, customer_id: 16, csa_id: 2>
# Csa id: 2,  equipment_id: 40

namespace :fixCSA_IDS do
   task doFix:  :environment do
    # @equipment = Equipment.all
    $e_count = 1
    @equipment = Equipment.where("NOT csa1 IS NULL") 
    @equipment.each do |e|
      puts "e_count = #{$e_count}"
      puts "e_csa1 = #{e.csa1}"
       #Find the CSA matching record
      @csa = Csa.where(csa: e.csa1)
      @csa.each do |c|
        if  c.csa = nil
          $csaid = "999X"
        else
       #Load the variable
          $csaid = @csa.first.id
        end
      end
      # Write the variable to the equipment record
      e.csa_id = $csaid
      e.save 
      $e_count = $e_count +1
      puts "e_count = #{$e_count}"
      puts "csaid = #{$csaid}"
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
 
