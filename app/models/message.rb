class Message < ApplicationRecord
	belongs_to :post, optional: true

	validates :post_id, presence: true
	validates :message_body, presence: true
	validates :sender_email, presence: true
end
