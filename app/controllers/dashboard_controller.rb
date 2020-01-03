class DashboardController < ApplicationController
	# Prevent unauthorized access
	before_action :authenticate_user!
  def index
  end
end
