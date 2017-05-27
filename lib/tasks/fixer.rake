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

namespace :fixEquipNotes do
  task doFix:  :environment do
    # **** Find all the equipment notes *****
    @en = EquipNote.all
    @en.each do |en| 
      #************* Store the equip_id 
      $eqid = en.equip_id
      # puts "en id = #{en.id}  eqid = #{$eqid}"
      #************  Find the Equipment record with the equip_id from the Notes
      @e = Equipment.where(equip_id: $eqid)
      # puts "Writing Equipment_id to EN Record = #{@e.first.id}"
      # ***********  Write the Equipment.id into the EquipNote equipment_id
      en.equipment_id = @e.first.id
      en.save
      # puts "Looping back to en"
    end
  end
end

 
      
      