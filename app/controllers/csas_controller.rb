class CsasController < ApplicationController
  
  def new
    @csa = Csa.new
  end
 
  def index
    @csas = Csa.by_CSA
  end
  
  def show
    @csa = Csa.find((params[:id]))
    
  end
  
  def edit
    @csa = Csa.find((params[:id]))  
  end
  
  def update
    @csa = Csa.find((params[:id]))  
    respond_to do |format|
      if @csa.update(csa_params)
        format.html { redirect_to @csa, notice: 'CSA was successfully updated.' }
        format.json { render :show, status: :ok, location: @csa }
      else
        format.html { render :edit }
        format.json { render json: @csa.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  
  def csa_params
      params.require(:csa).permit(:cust_id, :csa, :equip_id, :start_date, :end_date, :term, :equip_desc, :total_perks, :equipment_id)
    end
  
  
end