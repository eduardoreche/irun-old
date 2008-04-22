class BacklogItemsController < ApplicationController
  
  before_filter :load_backlog
  before_filter :load_products, :only => [:new, :edit, :create, :update]
  
  # GET /backlog_items
  # GET /backlog_items.xml
  def index
    @backlog_items = @backlog.backlog_items.find(:all, 
                                                 :order => ["ifnull(iteration,999999999), points desc"])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @backlog_items }
    end
  end

  # GET /backlog_items/1
  # GET /backlog_items/1.xml
  def show
    @backlog_item = @backlog.backlog_items.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @backlog_item }
    end
  end

  # GET /backlog_items/new
  # GET /backlog_items/new.xml
  def new
    @backlog_item = @backlog.backlog_items.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @backlog_item }
    end
  end

  # GET /backlog_items/1/edit
  def edit
    @backlog_item = @backlog.backlog_items.find(params[:id])
  end

  # POST /backlog_items
  # POST /backlog_items.xml
  def create
    @backlog_item = @backlog.backlog_items.build(params[:backlog_item])
    @backlog_item.user = session[:user]

    respond_to do |format|
      if @backlog_item.save
        flash[:notice] = 'BacklogItem was successfully created.'
        format.html { redirect_to(backlog_backlog_item_path(@backlog, @backlog_item)) }
        format.xml  { render :xml => @backlog_item, :status => :created, :location => @backlog_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @backlog_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /backlog_items/1
  # PUT /backlog_items/1.xml
  def update
    @backlog_item = BacklogItem.find(params[:id])
    @backlog_item.user = session[:user]
    
    respond_to do |format|
      if @backlog_item.update_attributes(params[:backlog_item])
        flash[:notice] = 'BacklogItem was successfully updated.'
        format.html { redirect_to(backlog_backlog_items_url(@backlog)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @backlog_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /backlog_items/1
  # DELETE /backlog_items/1.xml
  def destroy
    @backlog_item = BacklogItem.find(params[:id])
    @backlog_item.destroy

    respond_to do |format|
      format.html { redirect_to(backlog_backlog_items_url(@backlog)) }
      format.xml  { head :ok }
    end
  end
  
  private
  def load_backlog
    @backlog = Backlog.find(params[:backlog_id])
  end
  
  def load_products
    @products = Product.find(:all, :order => "name")
  end
end
