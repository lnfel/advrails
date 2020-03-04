class Post < ApplicationRecord
	# "optional: true" removes the error Type must exist being displayed on error messages
	belongs_to :type, optional: true
  has_and_belongs_to_many :category
  has_many_attached :feature_images
  has_many :messages, dependent: :destroy

  validates :type_id, presence: true
  validates :category_id, presence: true
  validates :title, presence: true
  validates :price, numericality: { message: " can't be empty." }, allow_nil: true
  validates :description, presence: true
  validates :email, presence: true
  #validates :price, format: { with: /\A[+-]?\d+\z/, message: "accepts integer only." }

  # kaminari pagination config via model
  # for global config look in: config/initializers/kaminari_config.rb
  paginates_per 2

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

  # Scope are used for chained queries like "Post.housing.recent.count" which counts Post with type_id of 3 and created with the last 24 hours
  # https://guides.rubyonrails.org/active_record_querying.html#merging-of-scopes
  scope :recent, -> { where created_at: 24.hours.ago..Time.now }
  scope :housing, -> { where type_id: 3..4 }
  scope :forsale, -> { where type_id: 1 }
  scope :jobs, -> { where type_id: 8 }
  scope :personals, -> { where type_id: 2 }
  scope :campus, -> { where type_id: 7 }
  scope :community, -> { where type_id: 5 }
  scope :services, -> { where type_id: 6 }
end
