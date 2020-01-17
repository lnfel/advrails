class Post < ApplicationRecord
	belongs_to :type
  has_and_belongs_to_many :category
  has_many_attached :feature_images

  validates_associated :type
  #validates :type_id, presence: true 
end
