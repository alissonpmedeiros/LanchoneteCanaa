class ProfitsController < ApplicationController
  before_action :set_profit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /profits
  # GET /profits.json
  def index
    Profit.destroy_all
    redirect_to new_profit_path
  end

  # GET /profits/1
  # GET /profits/1.json
  def show
    authorize @profit
    if @profit.option == 'Day'
      @accounts = Account.search_day(@profit.date)
      @purchases = Purchase.search_day(@profit.date)
    elsif @profit.option == 'Week'
      @accounts = Account.search_week(@profit.date)
      @purchases = Purchase.search_week(@profit.date)
    elsif @profit.option == 'Month'
      @accounts = Account.search_month(@profit.date)
      @purchases = Purchase.search_month(@profit.date)
    elsif @profit.option == 'Year'
      @accounts = Account.search_year(@profit.date)
      @purchases = Purchase.search_year(@profit.date)
    end

    @total_sales = Profit.total_sales(@accounts)
    @total_collected = Profit.total_collected(@accounts)
    @total_spun = Profit.total_spun(@accounts)
    @total_spun = Profit.total_spun(@accounts)
    @total_purchases = Profit.total_purchases(@purchases)
    
  end

  # GET /profits/new
  def new
    @profit = Profit.new
    authorize @profit
  end

  # GET /profits/1/edit
  def edit
    authorize @profit
  end

  # POST /profits
  # POST /profits.json
  def create
    @profit = Profit.new(profit_params)
    authorize @profit
    respond_to do |format|
      if @profit.save
        format.html { redirect_to @profit, notice: 'Profit was successfully created.' }
        format.json { render :show, status: :created, location: @profit }
      else
        format.html { render :new }
        format.json { render json: @profit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profits/1
  # PATCH/PUT /profits/1.json
  def update
    authorize @profit
    respond_to do |format|
      if @profit.update(profit_params)
        format.html { redirect_to @profit, notice: 'Profit was successfully updated.' }
        format.json { render :show, status: :ok, location: @profit }
      else
        format.html { render :edit }
        format.json { render json: @profit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profits/1
  # DELETE /profits/1.json
  def destroy
    authorize @profit
    @profit.destroy
    respond_to do |format|
      format.html { redirect_to profits_url, notice: 'Profit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profit
      @profit = Profit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profit_params
      params.require(:profit).permit(:option, :date)
    end
end
