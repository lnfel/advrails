class Message < ApplicationRecord
	belongs_to :post, optional: true

	
end
