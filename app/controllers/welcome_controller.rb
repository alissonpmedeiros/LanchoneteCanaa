class WelcomeController < ApplicationController
  def index
  	if current_user
  		redirect_to customers_path
  	end
  end
end
