class RegistrationsController < Devise::RegistrationsController

  before_filter :update_sanitized_params
 
  protected

  # my custom fields are :name, :heard_how
 

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :password, :password_confirmation, :role_ids => [], :performer_attributes => [ :first_name, :avatar, :photo_id, :profile_thumb, :profile_gif, :photo_id, :location_id, :avatar, :id  ] )}
  end

  def after_sign_up_path_for(resource)
    if current_user.has_role? :performer
      performers_performer_dashboard_path
    else
      admin_dashboard_path  
    end
  end
  
  def after_update_path_for(resource)
    if current_user.has_role? :admin
      admin_dashboard_path
    else
      performers_performer_dashboard_path
    end
  end
end
                                                                                                                     