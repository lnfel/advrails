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
  	@types = Type.all

    if params[:type].nil?
      # If type is nil, show all posts or if category is present, show posts using category_id
      @posts = params[:category].present? ? Post.where(category_id: params[:category]).order(created_at: :desc).page(params[:page]) : Post.with_attached_feature_images.order(created_at: :desc).page(params[:page])
    elsif params[:type].present? and params[:category].present?
      # If type and category have values
      @posts = Post.where(category_id: params[:category]).order(created_at: :desc).page(params[:page])
    else
      # If type has value show posts using type_id or if type is equal to 3, show posts using type_id 3 and 4 (Post.housing)
      @posts = params[:type] == "3" ? Post.housing.order(created_at: :desc).page(params[:page]) : Post.where(type_id: params[:type]).order(created_at: :desc).page(params[:page])
    end
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
  	@message = Message.new()
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

  @posts = if search.present?
  	puts "Searching for " + "'" + search.to_s + "'"
  	@results = Post.search(search, fields: [:title], limit: 5, match: :word_start, misspellings: {below: 1})
  	#puts @results.response
  	@results.each do |p|
  		puts "****************************************"
      Rails.logger.info '[ Title ] ' + p.title
      Rails.logger.info '[ Description ] ' + p.description.truncate(20)
      Rails.logger.info '[ Url ] ' + post_path(p)
      Rails.logger.info '[ Image Url ] ' + rails_blob_path(p.feature_images[0], disposition: "attachment", only_path: true) if p.feature_images[0].present?
  		#puts "Title: " + p.title
  		#puts "Description: " + p.description.truncate(100)
  		#puts "Url: " + post_path(p)
      #puts "Image url: " + rails_blob_path(p.feature_images[0], disposition: "attachment") if p.feature_images[0].present?
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
      puts "Image url: " + rails_blob_path(p.feature_images[0], disposition: "attachment") if p.feature_images[0].present?
  	end
  	puts "Found " + @results.count.to_s + " records."
  	#puts @results.as_json(only: [:title, :description], include: {type: {only: [:id, :name]}})
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
  	@results = Post.search(search, match: :word_start)
  	#puts @results.response
  	@results.each do |p|
  		puts "****************************************"
  		puts "Title: " + p.title
  		puts "Description: " + p.description.truncate(100)
  		puts "Url: " + post_path(p)
      puts "Image url: " + rails_blob_path(p.feature_images[0], disposition: "attachment") if p.feature_images[0].present?
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
      puts "Image url: " + rails_blob_path(p.feature_images[0], disposition: "attachment") if p.feature_images[0].present?
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
      @post = Post.with_attached_feature_images.find_by!(id: params[:id])
      @author_email = @post.email
      #Rails.logger.info @author_email

      # https://stackoverflow.com/questions/2336593/rescue-from-activerecordrecordnotfound-in-rails
      rescue ActiveRecord::RecordNotFound
    	flash[:notice] = "Try searching again or use the category list."
  		redirect_to :action => 'index'
    end

  	def post_params
  		params.require(:post).permit(:type_id, :category_id, :title, :price, :description, :email, :feature_images)
  	end

end
