class PerformersController < ApplicationController
 # layout "admin"
  before_action :set_performer, only: [:show, :edit, :update, :destroy], except: [:price]
  before_filter :authenticate_user!
  # GET /performers
  # GET /performers.json
  def index
    @performers = Performer.all
  end
  
  # GET /performers/1
  # GET /performers/1.json
  def show
    @performer = Performer.find(params[:id])
  end

  # GET /performers/new
  def new
    @performer = current_user.build_performer(params[:performer])
  end

  # GET /performers/1/edit
  def edit
  end
  
  def update_amount
    @ccp = ClipCategoryPerformer.create(:clip_category_id => params[:category], :performer_id => current_user.id, :amount => params[:amount].to_f)
    respond_to do |format|
      format.js { @ccp }
    end
  end

  # POST /performers
  # POST /performers.json
  def create
    @performer = current_user.build_performer(performer_params)

    respond_to do |format|
      if @performer.save
        format.html { redirect_to @performer, notice: 'Performer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @performer }
      else
        format.html { render action: 'new' }
        format.json { render json: @performer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /performers/1
  # PATCH/PUT /performers/1.json
  def update
    respond_to do |format|
      if @performer.update(performer_params)
        format.html { redirect_to @performer, notice: 'Performer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @performer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /performers/1
  # DELETE /performers/1.json
  def destroy
    @performer.destroy
    respond_to do |format|
      format.html { redirect_to performers_url }
      format.json { head :no_content }
    end
  end
 def performer_params
#  params.require(:performer).permit(:first_name, :white_label_id, :location_id, :avatar, :location, :photo_id, :profile_thumb, :profile_gif, :amount, :clip_category_performers_attributes => [:id, :clip_category_ids, :performer_ids, :amount], :clip_categories_attributes => [:id, :name, :amount])
   params.require(:performer).permit(:first_name, :white_label_id, :location_id, :avatar, :location, :photo_id, :profile_thumb, :profile_gif, :amount)
 end

    def performer_dashboard
      @performers = Performer.all

    end
   

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_performer
      @performer = Performer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    
    def price
      
    end
  
end
