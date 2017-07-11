class CustomersController < ApplicationController
  before_action :set_customer, only: [:edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.by_last_name
    #*************** Process for generating a csv file ****************
    #*************** Output is customers.csv in temp file
    respond_to do |format|
      format.html
      format.csv { send_data @customers.to_csv }
    end
    #************************************
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    # @customer = Customer.find(params[:id])
    @customer = Customer.includes(:equipment, :csas).find(params[:id])
    respond_to do |format|
      format.html { render action: "show" }
      # format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      
      params.require(:customer).permit(:cust_id, :first_name, :last_name, :address1, :address2, :city, :st, :zip, :home_phone, :work_phone, :cell_phone, :email, :auto_serv, :notes)
    end
end
