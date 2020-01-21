class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all
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

	def create
		@post = Post.new(post_params)
		@post.feature_images.attach(params[:post][:feature_images])

		respond_to do | format |
			if @post.save
				format.html { redirect_to @post, notice: 'Post was successfully created.' }
				format.json { render :show, status: :created, location: @post }
			else
				format.html { render :new }
				format.json { render json: @post.errors, status: :unprocessable_entity }
			end
		end
	end

	def show
		
	end

	private

		def set_post
      @post = Post.find(params[:id])
    end

		def post_params
			params.require(:post).permit(:type_id, :category_id, :title, :price, :description, :email, :feature_images)
		end

end
