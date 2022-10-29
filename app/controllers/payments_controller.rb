class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_payment, only: %i[ show edit update destroy ]

  # GET /payments or /payments.json
  def index
    @user = current_user
    @category = @user.categories
    @payments = @user.payments
  end

  # GET /payments/1 or /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @user = current_user
    @payment = Payment.new
    @categories = Category.where(user: @user)
  end

  # GET /payments/1/edit
  def edit
    @user = current_user
    @categories = Category.where(user: @user)
  end

  # POST /payments or /payments.json
  def create
    @current_user = current_user
    @categories = Category.where(user: @user)
    @payment = Payment.new(payment_params)
    back_category = @payment.categories.last
    @payment.user = @current_user

    respond_to do |format|
      if @payment.save
        format.html { redirect_to category_path(back_category), notice: "Payment was successfully created." }
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
      format.html { redirect_to categories_path, notice: "Payment was successfully destroyed." }
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
      params.require(:payment).permit(:name, :amount, category_ids: [])
    end
end
