# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

	def send_email_to_author
		require 'faker'
		paragraphs = Faker::Number.within(range: 4..7)
		message_body = Faker::Lorem.paragraphs(number: paragraphs, supplemental: false).map{|p| "#{p} "}.join
		puts message_body
		#post = Post.new(type_id: 3, category_id: 23, title: "Short-Term Furnished Room in Central Mountain View", price: 1200, description: "Hi there", email: "landlord@stanford.edu")
		#author_email = "landlord@stanford.edu"
		message = Message.new(post_id: 1, message_body: message_body, sender_email: "somebody@somewhere.com")
		#mail(to: author_email, subject: 'Someone left a message for you in SUpost.')
		#UserMailer.with(message: message, post: post).send_email_to_author
		UserMailer.send_email_to_author(message)
	end
end
