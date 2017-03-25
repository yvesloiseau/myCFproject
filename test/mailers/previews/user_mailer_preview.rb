# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	def contact_form
	    UserMailer.contact_form("john@example.com", "John", "Hello, you site is very nice. You are doing a good job at Career Foundry. Keep up the good work ans you wil acheive your goals.")
	end
end