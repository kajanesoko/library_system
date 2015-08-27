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
  	@item = Item.new
    @item.item_name = params[:item_name]
    @item.item_category = params[:item_category]
    @item.save
    #@item = Item.create({:name => params[:item_name], :category => params[:item_category]})
  end
end
