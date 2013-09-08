class DeliveryTimesController < ApplicationController
  before_action :set_delivery_time, only: [:show, :edit, :update, :destroy]

  # GET /delivery_times
  # GET /delivery_times.json
  def index
    @delivery_times = DeliveryTime.all
  end

  # GET /delivery_times/1
  # GET /delivery_times/1.json
  def show
  end

  # GET /delivery_times/new
  def new
    @delivery_time = DeliveryTime.new
  end

  # GET /delivery_times/1/edit
  def edit
  end

  # POST /delivery_times
  # POST /delivery_times.json
  def create
    @delivery_time = DeliveryTime.new(delivery_time_params)

    respond_to do |format|
      if @delivery_time.save
        format.html { redirect_to @delivery_time, notice: 'Delivery time was successfully created.' }
        format.json { render action: 'show', status: :created, location: @delivery_time }
      else
        format.html { render action: 'new' }
        format.json { render json: @delivery_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /delivery_times/1
  # PATCH/PUT /delivery_times/1.json
  def update
    respond_to do |format|
      if @delivery_time.update(delivery_time_params)
        format.html { redirect_to @delivery_time, notice: 'Delivery time was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @delivery_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_times/1
  # DELETE /delivery_times/1.json
  def destroy
    @delivery_time.destroy
    respond_to do |format|
      format.html { redirect_to delivery_times_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery_time
      @delivery_time = DeliveryTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delivery_time_params
      params.require(:delivery_time).permit(:duration)
    end
end
