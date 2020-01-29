class PostsController < ApplicationController
	#rescue_from ActiveRecord::RecordNotFound, with: :show_errors
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		search = params[:term].present? ? params[:term] : nil
		@search_result = if search
			#Post.where("title LIKE ? OR description LIKE ?", "%#{search}", "%#{search}")
			Post.search(search)
		else
			@posts = Post.order(created_at: :desc).page(params[:page])
		end
		@posts = Post.order(created_at: :desc).page(params[:page])
		@types = Type.all
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

	def search
		render json: Post.search(params[:query], {
      fields: ["title^5", "description"],
      match: :word_start,
      limit: 10,
      load: false,
      misspellings: {below: 5}
    }).map(&:title)
	end

	private

		def set_post
      @post = Post.find_by!(id: params[:id])

      # https://stackoverflow.com/questions/2336593/rescue-from-activerecordrecordnotfound-in-rails
      rescue ActiveRecord::RecordNotFound
      	flash[:notice] = "Try searching again or use the category list."
  			redirect_to :action => 'index'
    end

		def post_params
			params.require(:post).permit(:type_id, :category_id, :title, :price, :description, :email, :feature_images)
		end

end
