class HomeController < ApplicationController
  def logout
  	session[:user_id] = nil
  	redirect_to :action => 'index'
  end

  def index
  	@time = Time.now
  	@date = Date.today
  end

  def add_item
  	@item_id = Item.new(params[:item_id])
  	#@item_category = Item.new(params[:item_category])
  end
end
