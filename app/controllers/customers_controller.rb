class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /customers
  # GET /customers.json
  def index
    @q = Customer.ransack(params[:q])
    @customers = @q.result.order(:name).includes(:accounts).paginate(:page => params[:page], :per_page => 5)
    authorize @customers
    #@customers = Customer.order(:name).search(params[:search])
    #@customers = Customer.all.includes(:accounts)
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    authorize @customer
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    authorize @customer
  end

  # GET /customers/1/edit
  def edit
    authorize @customer
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    authorize @customer
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
    authorize @customer
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
    authorize @customer
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def pay_off
    if params[:customer]
      @customer = Customer.find(params[:customer])
      authorize @customer
      Customer.pay_off(@customer)
      redirect_to @customer
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :email, :phone)
    end
end
