

class HomeController < ApplicationController

  def live_items_search
    if params[:action_name] == "borrow"
      @items = Item.limit(100).joins("LEFT JOIN borrow b 
        ON b.item_id = item.item_id").where("b.approval_status = 0 OR b.approval_status IS NULL
        AND item_name LIKE '%#{params[:search_str]}%'")
    elsif params[:action_name] == "request"
      @items = Item.limit(100).joins("LEFT JOIN borrow b 
        ON b.item_id = item.item_id").where("b.approval_status = 0
        AND item_name LIKE '%#{params[:search_str]}%'")
    end
    render :text => @items.to_json and return
  end

  def search
    if params[:action_name] == "borrow"
      @items = Item.limit(100).joins("LEFT JOIN borrow b 
        ON b.item_id = item.item_id").where("b.approval_status = 0 OR b.approval_status IS NULL")
    elsif params[:action_name] == "request"
      @items = Item.limit(100).joins("INNER JOIN borrow b 
        ON b.item_id = item.item_id").where("b.approval_status = 0")
    end
  end

  def logout
  	session[:user_id] = nil
  	redirect_to :action => 'index'
  end

  def index
  	@time = Time.now
  	@date = Date.today
    @items = Item.all.order(:item_category_id)
    @item_category = ItemCategory.all
    if request.post?
      @items = Item.all.where("item_name like ?", "%"+params[:search]+"%").order(:item_category_id)
    end
  end

  def borrow
    item = Item.where(:item_id => params[:item_id]).first
      
    borrow = Borrow.find_by_item_id(item.id) || Borrow.new()
    borrow.user_id = session[:user_id]
    borrow.item_id = item.item_id
 
    borrow.save
    redirect_to '/search/borrow'
  end

  def reject

    Borrow.where(item_id: params[:item_id]).update_all(approval_status: 1,
      reason: 'Contact The Administrator')
    flash[:notice] = "Item Rejected with reasons described."
    redirect_to '/search/request'
  end

  def approve
    item = Item.where(:item_id => params[:item_id]).first

    @issue = Issue.new
    @issue.user_id = session[:user_id]
    @issue.item_id = item.item_id
    @issue.date_of_issue = Date.today
    @issue.date_of_return = Date.today + 7.days
    @issue.save


    Borrow.find_by_item_id(params[:item_id]).destroy
    

    #@approve_items.update_attribute('status', params[:approve_status]) if !@approve_items.blank?
    flash[:notice] = "Item Approved"
    redirect_to '/search/request'
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
    @borrow_requests = Borrow.where(:reason => nil)
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

  def profile
    @borrow_notification = Borrow.all.where(:user_id => session[:user_id])
    @issue_notification = Issue.all.where(:user_id => session[:user_id])
  end



end
