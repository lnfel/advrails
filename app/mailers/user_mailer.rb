class UserMailer < ApplicationMailer
	default from: 'notification@supost.com'

	def send_email_to_author
		@message = params[:message]
		
	end
end
