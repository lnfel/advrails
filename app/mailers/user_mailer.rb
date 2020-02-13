class UserMailer < ApplicationMailer

	def send_email_to_author
		author_email = params[:post][:email]
		#author_email = "somebody@somewhere.com"
		@message = params[:message]
		mail(to: author_email, subject: 'Someone left a message for you in SUpost.')
	end
end
