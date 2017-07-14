class CustomersController < ApplicationController
  before_action :set_customer, only: [:edit, :update, :destroy]

  # GET /customers
  
  def index
    # @customers = Customer.by_last_name
    @customers = Customer.by_last_first_name
    #*************** Process for generating a csv file ****************
    #*************** Output is customers.csv in temp file
    respond_to do |format|
      format.html
      format.csv { send_data @customers.to_csv }
    end
    #************************************
  end

  # GET /customers/1
  
  def show
    # @customer = Customer.find(params[:id])
    @customer = Customer.includes(:equipment, :csas).find(params[:id])
    
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  
  def create
    
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /customers/1
  
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /customers/1
  
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
    end
  end

  private
    
    def set_customer
      @customer = Customer.find(params[:id])
    end

    
    def customer_params
      
      params.require(:customer).permit(:cust_id, :first_name, :last_name, :address1, :address2, :city, :st, :zip, :home_phone, :work_phone, :cell_phone, :email, :auto_serv, :notes)
    end
end
