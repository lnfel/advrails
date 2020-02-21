class UserMailer < ApplicationMailer

	def send_email_to_author(message)
		#author_email = params[:post][:email]
		#puts author_email
		#author_email = "somebody@somewhere.com"
		@message = message
		puts message.post_id
		@post = Post.find_by(id: message.post_id)
		puts @post
		puts message.sender_email
		#puts
		mail(to: @post.email, subject: 'Someone left a message for you in SUpost.')
	end
end
