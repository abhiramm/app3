class Notificationemail < ActionMailer::Base
  default from: "pro.aravind@gmail.com"
  def order_customer(user_details)
  	mail(:to => user_details.email, :subject => "You have ordered a video succesfully")
  end
  def order_performer(user_details)
  	mail(:to => user_details.email, :subject => "You have have got a video request")
  end
  def order_admin(user_details)
  	mail(:to => user_details.email, :subject => "A person has order video")
  end
  def uploaded_customer(user_details)
  	mail(:to => user_details.email, :subject => "You have got the video you ordered, enjoy!")
  end
  def uploaded_performer(user_details)
  	mail(:to => user_details.email, :subject => "You have succesfully uploaded the video")
  end
  def uploaded_admin(user_details)
  	mail(:to => user_details.email, :subject => "A performer has succesfully uploaded a video")
  end
end