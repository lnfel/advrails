class ApplicationController < ActionController::Base
	require 'uri'
	# allow rendering of json
	include ActionView::Rendering

	def index
		render html: "Welcome to Rails 6, first subdomain of wolfsummer.tk"
	end
end
