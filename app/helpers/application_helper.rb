module ApplicationHelper
	def markdown
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, hard_wrap: true, filter_html: true, autolink: true, no_intra_emphasis: true, tables: true)
	end
end
