class HomeController < ApplicationController
  def logout
  	session[:user_id] = nil
  	redirect_to :action => 'index'
  end

  def index
  	@time = Time.now
  	@date = Date.today
    @items = Item.all
    
  end

  def add_item
    if request.post?
    	@item = Item.new
      @item.item_name = params[:item_name]
      @item.item_category_id = params[:item_category_id]
      @item.author = params[:author]
      @item.publisher = params[:publisher]
      @item.year = params[:year]
      @item.edition = params[:edition]
      @item.description = params[:description]
      @item.serial = params[:serial]
      #@item.void = params[:void] //for Void Controls
      #@item.void_reason = params[:void_reason] //for Void Reaon Control.
      @item.save
    end
    
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
