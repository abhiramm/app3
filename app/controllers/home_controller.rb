class HomeController < ApplicationController
  def index
    @performer = Performer.new
  end
  def get_image
    puts "welcome to get_image"
    @performer = Performer.find(params[:performer_id]) unless params[:performer_id].blank?
  end
   def admin_dashboard
      @performers = Performer.all
    end
end
