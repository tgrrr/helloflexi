class CouponsController < ApplicationController
  before_action :set_coupon, only: [:show, :edit, :update, :destroy]

  # GET /coupons
  # GET /coupons.json
  def index
    if current_user.try(:admin?)
      @coupons = Coupon.all
    else
      redirect_to root_url, notice: "Current user is not allowed to enter this page"
    end
  end

  # GET /coupons/1
  # GET /coupons/1.json
  def show
  end

  # GET /coupons/new
  def new
    @coupon = Coupon.new
  end

  # GET /coupons/1/edit
  def edit
  end

  # POST /coupons
  # POST /coupons.json
  def create
    coupon_params[:code].downcase!
    @coupon = Coupon.new(coupon_params)
    respond_to do |format|
      if @coupon.save
        Stripe::Coupon.create(
          :percent_off => coupon_params[:percent_off].presence || nil,
          :amount_off => coupon_params[:amount_off].presence || nil,
          :currency => coupon_params[:currency],
          :max_redemptions => coupon_params[:max_redemptions].presence || nil,
          :duration => 'repeating',
          :duration_in_months => coupon_params[:duration_in_months],
          :id => coupon_params[:code]
        )

        format.html { redirect_to @coupon, notice: 'Coupon was successfully created.' }
        format.json { render :show, status: :created, location: @coupon }
      else
        format.html { render :new }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupons/1
  # PATCH/PUT /coupons/1.json
  def update
    respond_to do |format|
      if @coupon.update(coupon_params)
        format.html { redirect_to @coupon, notice: 'Coupon was successfully updated.' }
        format.json { render :show, status: :ok, location: @coupon }
      else
        format.html { render :edit }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupons/1
  # DELETE /coupons/1.json
  def destroy
    @coupon.destroy
    respond_to do |format|
      format.html { redirect_to coupons_url, notice: 'Coupon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon
      @coupon = Coupon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coupon_params
      params.require(:coupon).permit(:code, :percent_off, :amount_off, :currency, :object_name, :duration, :livemode, :redeem_by, :max_redemptions, :times_redeemed, :duration_in_months, :is_valid)
    end
end
