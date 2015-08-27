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
    if request.post?
    	@item = Item.new
      @item.item_name = params[:item_name]
      @item.item_category = params[:item_category]
      @item.save
    end
    #@item = Item.create({:name => params[:item_name], :category => params[:item_category]})
  end

  def view_item

  end

  def add_user
    if request.post?
      @user = User.new
      @user.firstname = params[:firstname]
      @user.lastname = params[:lastname]
      @user.username = params[:username]
      @user.password_hash = params[:username]
      @user.user_role = 'staff'
      @user.save
    end
  end

end
