class Post < ApplicationRecord
	# "optional: true" removes the error Type must exist being displayed on error messages
	belongs_to :type, optional: true
  has_and_belongs_to_many :category
  has_many_attached :feature_images

  validates :type_id, presence: true
  validates :category_id, presence: true
  validates :description, presence: true
  validates :price, format: { with: /\A[+-]?\d+\z/, message: "accepts integer only." }
end
