class UserMailer < ApplicationMailer
	default from: 'notification@supost.com'

	def send_email_to_author
		author_email = params[post[:email]]
		@message = params[:message]
		mail(to: author_email, subject: 'Someone left a message for you in SUpost.')
	end
end
