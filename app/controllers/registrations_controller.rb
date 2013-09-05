class RegistrationsController < Devise::RegistrationsController

  before_filter :update_sanitized_params
 
  protected

  # my custom fields are :name, :heard_how
 

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :password, :password_confirmation, :performer_attributes => [ :first_name, :avatar, :photo_id ] )}
  end

  def after_sign_up_path_for(resource)
    edit_user_registration_path
  end
  
  def after_update_path_for(resource)
    performers_performer_dashboard_path
  end
end
                                                                                                                     