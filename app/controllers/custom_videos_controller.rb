class CustomVideosController < ApplicationController
  before_action :set_custom_video, only: [:show, :edit, :update, :destroy]

  # GET /custom_videos
  # GET /custom_videos.json
  def index
    @custom_videos = CustomVideo.all
  end

  # GET /custom_videos/1
  # GET /custom_videos/1.json
  def show
  end

  # GET /custom_videos/new
  def new
    @custom_video = CustomVideo.new
  end

  # GET /custom_videos/1/edit
  def edit
  end

  # POST /custom_videos
  # POST /custom_videos.json
  def create
    @custom_video = CustomVideo.new(custom_video_params)

    respond_to do |format|
      if @custom_video.save
        Notificationemail.uploaded_customer(current_user)
        Notificationemail.uploaded_performer()
        format.html { redirect_to @custom_video, notice: 'Custom video was successfully created.' }
        format.json { render action: 'show', status: :created, location: @custom_video }
      else
        format.html { render action: 'new' }
        format.json { render json: @custom_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custom_videos/1
  # PATCH/PUT /custom_videos/1.json
  def update
    respond_to do |format|
      if @custom_video.update(custom_video_params)
        format.html { redirect_to @custom_video, notice: 'Custom video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @custom_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_videos/1
  # DELETE /custom_videos/1.json
  def destroy
    @custom_video.destroy
    respond_to do |format|
      format.html { redirect_to custom_videos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_video
      @custom_video = CustomVideo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custom_video_params
      params.require(:custom_video).permit(:path)
    end
end