class UserMailer < ApplicationMailer
  default from: "birdyves1958@yahoo.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => "birdyves1958@yahoo.com",
        :subject => "A new contact form message from #{name}")
  end


end
