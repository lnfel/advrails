class PostsController < ApplicationController
	#rescue_from ActiveRecord::RecordNotFound, with: :show_errors
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		#search = params[:term].present? ? params[:term] : nil
		#@search_result = if search
			#Post.where("title LIKE ? OR description LIKE ?", "%#{search}", "%#{search}")
		#	Post.search(search)
		#else
		#	@posts = Post.order(created_at: :desc).page(params[:page])
		#end
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

	def autocomplete
		# for typeahead but not working due to bloodhound
		#render json: Post.search(params[:terms], {
    #  fields: ["title^5", "description"],
    #  match: :word_middle,
    #  limit: 5,
    #  load: false,
    #  misspellings: {below: 5}
    #}).map(&:title)

    search = params[:term].present? ? params[:term] : nil

    @posts = if search
    	puts "Searching for " + "'" + search.to_s + "'"
    	@results = Post.search(search, limit: 5, match: :word_middle)
    	#puts @results.response
    	@results.each do |p|
    		puts "****************************************"
    		puts "Title: " + p.title
    		puts "Description: " + p.description.truncate(100)
    		puts "Url: " + post_path(p)
    	end
    	puts "Found " + @results.total_count.to_s + " result(s)"
    	puts "Finished in " + @results.took.to_s + " milliseconds"
    	puts "****************************************"
    else
    	@results = Post.all
    	@results.each do |p|
    		puts "****************************************"
    		puts "Title: " + p.title
    		puts "Description: " + p.description.truncate(100)
    		puts "Url: " + post_path(p)
    	end
    	puts "Found " + @results.count.to_s + " records."
    	puts @results.as_json(only: [:title, :description], include: {type: {only: [:id, :name]}})
    end

    #@posts = Post.search(params[:term])

    #@posts = Post.all
    #render json: {posts: []}
    #render file: 'posts/search.json.jbuilder'
    render 'autocomplete', formats: :json, handlers: 'jb'
	end

	def search
		# for typeahead but not working due to bloodhound
		#render json: Post.search(params[:query], {
    #  fields: ["title^5", "description"],
    #  match: :word_start,
    #  limit: 10,
    #  load: false,
    #  misspellings: {below: 5}
    #}).map(&:title)

    search = params[:term].present? ? params[:term] : nil

    @posts = if search
    	puts "Searching for " + "'" + search.to_s + "'"
    	@results = Post.search(search, match: :word_middle)
    	#puts @results.response
    	@results.each do |p|
    		puts "****************************************"
    		puts "Title: " + p.title
    		puts "Description: " + p.description.truncate(100)
    		puts "Url: " + post_path(p)
    	end
    	puts "Found " + @results.total_count.to_s + " result(s)"
    	puts "Finished in " + @results.took.to_s + " milliseconds"
    	puts "****************************************"
    else
    	@results = Post.search("*")
    	@results.each do |p|
    		puts "****************************************"
    		puts "Title: " + p.title
    		puts "Description: " + p.description.truncate(100)
    		puts "Url: " + post_path(p)
    	end
    	# if using Post.all, 'total_count' and 'took' method will not work since it is only scoped by elasticsearch
    	# in ActiveRecord we can use 'count' method
    	puts "Found " + @results.total_count.to_s + " result(s)"
    	puts "Finished in " + @results.took.to_s + " milliseconds"
    	puts "****************************************"
    	# show as_json format
    	#puts @results.as_json(only: [:title, :description], include: {type: {only: [:id, :name]}})
    end

    #@posts = Post.search(params[:term])

    #@posts = Post.all
    #render json: {posts: []}
    #render file: 'posts/search.json.jbuilder'
    #render 'search', formats: :json, handlers: 'jb'
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
