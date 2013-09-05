class HomeController < ApplicationController
  def index
    @performer = Performer.new
  end
  def get_image
    @performer = Performer.find(params[:order][:performer_id]) unless params[:order][:performer_id].blank?
  end
   def admin_dashboard
      @performers = Performer.all
    end
end
