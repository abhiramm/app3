class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,:invitable
  # :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :performer
 # validates_presence_of :location
  accepts_nested_attributes_for :performer
  
   def update_with_password(params={})
   current_password = params.delete(:current_password)

   if params[:password].blank?
     params.delete(:password)
     params.delete(:password_confirmation) if params[:password_confirmation].blank?
   end

   result =  if params[:password].blank? || valid_password?(current_password)
   update_attributes(params)
   else
     self.attributes = params
     self.valid?
     self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
     false
   end

   clean_up_passwords
   result
 end
  
end
