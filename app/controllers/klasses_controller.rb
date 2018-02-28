class KlassesController < ApplicationController
  before_action :set_klass, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /klasses
  # GET /klasses.json
  def index
    @klasses = Klass.all.paginate(:page => params[:page], :per_page => 20)
  end

  # GET /klasses/1
  # GET /klasses/1.json
  def show
  end

  # GET /klasses/1/edit
  def edit
  end

  # PATCH/PUT /klasses/1
  # PATCH/PUT /klasses/1.json
  def update
    respond_to do |format|
      if @klass.update(klass_params)
        format.html { redirect_to @klass, notice: 'Class was successfully updated.' }
        format.json { render :show, status: :ok, location: @klass }
      else
        format.html { render :edit }
        format.json { render json: @klass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /klasses/1
  # DELETE /klasses/1.json
  def destroy
    @klass.destroy
    respond_to do |format|
      format.html { redirect_to klasses_url, notice: 'Class was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_klass
      @klass = Klass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def klass_params
      params.require(:klass).permit(:id, :title, :all_day, :start_timestamp, :end_timestamp, :studio_id, :can_book, :max_capacity, :web_capacity, :total_booked, :address, :city, :state_prov_code, :postal_code, :latitude, :longitude, :business_description, :location_name, :level, :class_description, :class_type, :session_type_name, :staff_name, :staff_bio, :staff_avatar, :blacklist, :is_canceled)
    end
end
