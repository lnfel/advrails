class Post < ApplicationRecord
	# "optional: true" removes the error Type must exist being displayed on error messages
	belongs_to :type, optional: true
  has_and_belongs_to_many :category
  has_many_attached :feature_images

  validates :type_id, presence: true
  validates :category_id, presence: true
  validates :title, presence: true
  validates :price, numericality: { message: " can't be empty." }
  validates :description, presence: true
  validates :email, presence: true
  #validates :price, format: { with: /\A[+-]?\d+\z/, message: "accepts integer only." }

  # kaminari pagination config via model
  # for global config look in: config/initializers/kaminari_config.rb
  paginates_per 1
end
