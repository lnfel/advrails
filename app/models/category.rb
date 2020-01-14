class Category < ApplicationRecord
  has_and_belongs_to_many :post
  belongs_to :type
end
