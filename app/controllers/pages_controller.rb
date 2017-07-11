class PagesController < ApplicationController
  def home
    @customers = Customer.by_last_name
    @equipment = Equipment.all
  end

  def about
    
  end

  def contact
  end
  
  def tech_news
    
  end
  
end