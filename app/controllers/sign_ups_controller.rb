class SignUpsController < ApplicationController
  before_action :set_sign_up, only: [:show, :edit, :update, :destroy]

  # GET /sign_ups
  # GET /sign_ups.json
  def index
    if current_user.try(:admin?)
      @sign_ups = SignUp.all
    else
      redirect_to root_url, notice: "Current user is not allowed to enter this page"
    end
  end

  # GET /sign_ups/1
  # GET /sign_ups/1.json
  def show
  end

  # GET /sign_ups/new
  def new
    @sign_up = SignUp.new
  end

  # GET /sign_ups/1/edit
  def edit
  end

  # POST /sign_ups
  # POST /sign_ups.json
  def create
    @sign_up = SignUp.new(sign_up_params)
    @sign_up.klass_id = params[:klass_id]
    if @sign_up.save
      SignUpMailer.sign_up_email(@sign_up).deliver
      redirect_to classes_path, notice: "You have sucessfully signed up for the class"
    else
      render :new
    end
  end

  # PATCH/PUT /sign_ups/1
  # PATCH/PUT /sign_ups/1.json
  def update
    respond_to do |format|
      if @sign_up.update(sign_up_params)
        format.html { redirect_to @sign_up, notice: 'sign_up was successfully updated.' }
        format.json { render :show, status: :ok, location: @sign_up }
      else
        format.html { render :edit }
        format.json { render json: @sign_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sign_ups/1
  # DELETE /sign_ups/1.json
  def destroy
    @sign_up.destroy
    respond_to do |format|
      format.html { redirect_to sign_ups_url, notice: 'sign_up was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def penalize
    @sign_up = SignUp.find(params[:sign_up_id])
    @sign_up.update(did_not_attend: true)
    redirect_to sign_ups_path, notice: "This student has been penalized."
  end

  def cancel
    @sign_up = SignUp.find(params[:id])
    unless @sign_up.canceled?
      @sign_up.update(canceled: true, canceled_at: Time.now)
      #Todo some delayed job needs to be implemented
      SignUpMailer.sign_up_email(@sign_up).deliver_now
      respond_to do |format|
        format.html {redirect_to sign_ups_path, notice: "sign_up was successfully cancelled"}
        format.json {render json: {message: "Your class is cancelled. Thanks for the heads up!"}}
      end
    else
      respond_to do |format|
        format.html {redirect_to sign_ups_path, notice: "this sign_up has already been canceled"}
        format.json {render json: {message: "Your class was already cancelled. Enthusiastic much?"}}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sign_up
      @sign_up = SignUp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sign_up_params
      params.require(:sign_up).permit(:klass_id, :user_id, :attended, :did_not_attend)
    end
end
