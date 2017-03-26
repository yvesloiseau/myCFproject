class UserMailer < ApplicationMailer
  default from: "loiseau.y@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'loiseau.y@gmail.com',
        :subject => "A new contact form message from #{name}")
  end


end
