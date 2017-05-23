class CsasController < ApplicationController
  

 
  def index
    @csas = Csa.by_CSA
  end
  
  def show
    @csa = Csa.find((params[:id]))
    
  end
  
  private
  
  def csa_params
      params.require(:csa).permit(:cust_id, :csa, :equip_id, :start_date, :end_date, :term, :equip_desc, :total_perks, :equipment_id)
    end
  
  
end