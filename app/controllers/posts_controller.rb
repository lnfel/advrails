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
	end
end
