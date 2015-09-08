

class HomeController < ApplicationController

  def logout
  	session[:user_id] = nil
  	redirect_to :action => 'index'
  end

public

  def index
  	@time = Time.now
  	@date = Date.today
    @items = Item.all.order(:item_category_id)
    @item_category = ItemCategory.all
    if request.post?
      @items = Item.all.where("item_name like ?", "%"+params[:search]+"%").order(:item_category_id)
    end

    Item.joins('INNER JOIN "item_category" ON "item_category"."item_category_id" = "item"."item_category_id" ')

  end

  def borrow
    @item = Item.where(:item_id => params[:passed_item_id_to_borrow]).first
    @item.update_attribute('status', params[:borrow_status]) if !@item.blank?
    redirect_to '/home/index'
  end

  def reject
    @reject_items = Item.where(:item_id => params[:passed_item_id_to_reject]).first
    @reject_items.update_attribute('status', params[:reject_status]) if !@reject_items.blank?
    flash[:notice] = "Item Rejected with reasons described."
    redirect_to '/home/view_item'
  end

  def approve
    @approve_items = Item.where(:item_id => params[:passed_item_id_to_approve]).first
    @approve_items.update_attribute('status', params[:approve_status]) if !@approve_items.blank?
    flash[:notice] = "Item Approved"
    redirect_to '/home/view_item'
  end

  def add_item
    @item_category = ItemCategory.all
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
    @borrow_requests = Item.all.order(:item_category_id)
    if request.post?
      @borrow_requests = Item.all.where("item_name like ?", "%"+params[:search]+"%").order(:item_category_id)
    end
  end

  def add_user
    if request.post?
      @user = User.new
      @user.firstname = params[:firstname]
      @user.lastname = params[:lastname]
      @user.username = params[:username]
      @user.password_hash = params[:password]
      @user.user_role = 'staff'
      @user.save
    end
  end

  def add_category

    if request.post?
      @item_category = Category.new
      @item_category.name = params[:name]
      @item_category.cat_description = params[:cat_description]

      @item_category.save
    end
  end
  def edit_item
      @item_category = ItemCategory.all
      @item = Item.find(params[:id])
      #raise @item.inspect
      if request.post?
        @item = Item.find_by(item_id: params['id'])
        @item.update_attributes(item_name: params['name'],
                                item_category_id: params['item_category_id'],
                                author: params['author'],
                                publisher: params['publisher'],
                                year: params['year'],
                                edition: params['edition'],
                                description: params['description'],
                                serial: params['serial'])
      flash[:notice] = "Message"
      redirect_to '/home/index'
      end

  end

  def update
    if request.post?
      @item = Item.find_by(item_id: params['id'])
      @item.update_attributes(item_name: params['name'],
                              item_category_id: params['item_category_id'],
                              author: params['author'],
                              publisher: params['publisher'],
                              year: params['year'],
                              edition: params['edition'],
                              description: params['description'],
                              serial: params['serial'])
    redirect_to :action => 'index'
    else
      redirect_to :action => 'edit_item'
      #raise params.inspect
    end
  end

  def delete
    @item = Item.find(params[:id])
    #raise @item.inspect
  end

  def void
    if request.post?
      @item = Item.find_by(item_id: params['id'])
      @item.update_attributes(void_reason: params['void_reason'], void: "1")
      redirect_to :action => 'index'
    else
      redirect_to :action => 'index'
      #raise params.inspect
    end
  end

end
