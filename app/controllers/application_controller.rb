class ApplicationController < ActionController::Base
	def index
		render html: "Welcome to Rails 6, first subdomain of wolfsummer.tk"
	end
end
