class UserMailer < ActionMailer::Base
  default from: "meer_online@yahoo.com"

  def welcome_email(user)
  	@user = user
  	@url = "http://meer_online.herokuapp.com/login"
  	mail(:to => user.email, :subject => "Welcome to My Awesome wrist Watches Site")  	
  end
end
