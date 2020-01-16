class PostsController < ApplicationController
	def index
		
	end

	def new
		@post = Post.new()
		@grouped_options = [
			'Type of post' => [
				['Type of post', 1],
				['For Sale', 2]
			]
		]

		# https://fool-dev.com/how-to-create-a-dependent-dropdown-in-ruby-on-rails/
		if params[:type].present?
			@category = Type.find(params[:type]).category
		else
			@category = Category.all
		end

		if request.xhr?
			respond_to do | format |
				format.json {
					render json: {category: @category}
				}
			end
		end
	end

end
