class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  layout :layout_by_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
  
  #def after_sign_in_path_for(resource)
    # performer_path(:id => current_user.performer)
  #end

  def layout_by_resource
    if user_signed_in?
   #   "admin"
  #else
     "application"
    end
  end
  
   def after_sign_in_path_for(resource_or_scope)
      if current_user.has_role? :performer
        performers_performer_dashboard_path
      else
        admin_dashboard_path
        
      end 
   end

 
  protected
 
  # my custom fields are :name, :heard_how
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :email, :password, :password_confirmation, :current_password, :role_ids,  :performer_attributes => [:first_name, :avatar, :photo_id, :profile_thumb, :profile_gif, :photo_id, :location_id, :avatar, :id , :clip_category_performers_attributes => [:id, :clip_category_ids]])
    end
        Rails.logger.info'****************************************'

  end
end
