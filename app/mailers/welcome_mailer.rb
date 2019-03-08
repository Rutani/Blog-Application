class WelcomeMailer < ApplicationMailer
	def welcome_send(user)
		@user=user
		mail to: user.email, subject: "welcome to blog application...thank you", from:'rutani.thakkar@gmail.com'
	end
end
