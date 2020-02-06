class Post < ApplicationRecord
	# "optional: true" removes the error Type must exist being displayed on error messages
	belongs_to :type, optional: true
  has_and_belongs_to_many :category
  has_many_attached :feature_images
  has_many :message

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

  # enable searchkick
  searchkick word_start: [:title]
  # Post.reindex doesn't work here
  # instead run `elasticsearch` on another console then do the following code in the console afterwards:
  # rails run searchkick:reindex CLASS=Post

  #def search_data
  #  {
  #    title: title,
  #    description: description,
  #    feature_image: feature_images[0]
  #  }
  #end
end
