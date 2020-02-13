class MessagesController < ApplicationController

	def create
		@message = Message.new(message_params)

		respond_to do |format|
			if @message.save
				UserMailer.with(message: @message).send_email_to_author.deliver_later
				format.html { redirect_to post_path(@message.post_id), notice: 'Message sent!' }
				format.json { render :show, status: :created, location: @post }
			else
				format.html { redirect_to post_path(@message.post_id), alert: 'Message send failed!' }
				format.json { render json: @message.errors, status: :unprocessable_entity }
			end
		end
	end

	private

		def message_params
      params.require(:message).permit(:post_id, :message_body, :sender_email)
    end
end
