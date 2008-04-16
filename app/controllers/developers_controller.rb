class DevelopersController < ApplicationController
  
  before_filter :load_sprint
  before_filter :load_users

  # GET /developers
  # GET /developers.xml
  def index
    @developers = @sprint.developers.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @developers }
    end
  end

  # GET /developers/1
  # GET /developers/1.xml
  def show
    @developer = @sprint.developers.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @developer }
    end
  end

  # GET /developers/new
  # GET /developers/new.xml
  def new
    @developer = @sprint.developers.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @developer }
    end
  end

  # GET /developers/1/edit
  def edit
    @developer = @sprint.developers.find(params[:id])
  end

  # POST /developers
  # POST /developers.xml
  def create
    @developer = @sprint.developers.build(params[:developer])

    respond_to do |format|
      if @developer.save
        flash[:notice] = 'Developer was successfully created.'
        format.html { redirect_to(sprint_developer_path(@sprint,@developer)) }
        format.xml  { render :xml => @developer, :status => :created, :location => @developer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @developer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /developers/1
  # PUT /developers/1.xml
  def update
    @developer = @sprint.developers.find(params[:id])

    respond_to do |format|
      if @developer.update_attributes(params[:developer])
        flash[:notice] = 'Developer was successfully updated.'
        format.html { redirect_to(sprint_developer_path(@sprint,@developer)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @developer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /developers/1
  # DELETE /developers/1.xml
  def destroy
    @developer = @sprint.developers.find(params[:id])
    @developer.destroy

    respond_to do |format|
      format.html { redirect_to(sprint_developers_url(@sprint)) }
      format.xml  { head :ok }
    end
  end
  
  private
  def load_sprint
    @sprint = Sprint.find(params[:sprint_id])
  end
  
  def load_users
    @users = User.find(:all, :order => "name")
  end
  
end
