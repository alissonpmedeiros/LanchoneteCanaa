class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_customers, only: [:new, :show, :edit]
  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
    authorize @accounts
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    authorize @account
  end

  # GET /accounts/new
  def new
    @account = Account.new
    authorize @account
    if params[:customer]
      @account.customer = Customer.find(params[:customer])
    end
  end

  # GET /accounts/1/edit
  def edit
    authorize @account
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)
    authorize @account
    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    authorize @account
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    authorize @account
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    def set_customers
      @customers = Customer.order(:name)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:price, :salesman, :description, :status, :customer_id)
    end
end
