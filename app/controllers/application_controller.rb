class ApplicationController < ActionController::Base
	require 'uri'

	def index
		render html: "Welcome to Rails 6, first subdomain of wolfsummer.tk"
	end
end
