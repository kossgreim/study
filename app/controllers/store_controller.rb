class StoreController < ApplicationController
  skip_before_filter :authorize
  before_action :current_cart, only: [:index]
  
  def index
  	@products = Product.order(:title)
  	#@cart = current_cart
  end
end
