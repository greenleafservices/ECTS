task :show_current_directory do
  puts "My PWD = #{'pwd'}"
end

namespace :test1 do
  task :test2 do
    puts "My task PWD = #{'pwd'}"
  end 
end

# namespace :fixIDS do
#   task :doFix do
#     @equipment = Equipment.all
#     @equipment.each do |e|
#       @customer = Customer.where(cust_id: e.cust_id.to_i)
#       ccid = @customer.first.id
#       e.customer_id = ccid
#       e.save  
#     end
#   end
# end