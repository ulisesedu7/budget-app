class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_payment, only: %i[ show edit update destroy ]

  # GET /payments or /payments.json
  def index
    @user = current_user
    @category = @user.categories
    @payments = @category.payments
  end

  # GET /payments/1 or /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
    @category = Category.find(params[:category_id])
  end

  # GET /payments/1/edit
  def edit
    @category = Category.find(params[:category_id])
    @payment = Payment.find(params[:id])
  end

  # POST /payments or /payments.json
  def create
    @current_user = current_user
    @category = Category.find(params[:category_id])
    @payment = Payment.new(payment_params)

    @payment.author = @current_user
    params[:payments][:categories].each do |id|
      @payment.categories.push(Category.find(id)) if id != ''
    end

    respond_to do |format|
      if @payment.save
        format.html { redirect_to payment_url(@payment), notice: "Payment was successfully created." }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1 or /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to payment_url(@payment), notice: "Payment was successfully updated." }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1 or /payments/1.json
  def destroy
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url, notice: "Payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_params
      params.require(:payment).permit(:author_id, :name, :amount)
    end
end
