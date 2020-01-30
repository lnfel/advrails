# to use jbuilder for json rendering
# uncomment render file: 'posts/search.json.jbuilder' in posts#search
# then comment render 'search', formats: :json, handlers: 'jb'
json.posts do
	json.array!(@posts) do |p|
		json.title p.title
		json.description p.description.truncate(100)
		json.url post_path(p)
	end
end