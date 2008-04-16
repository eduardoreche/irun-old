class BacklogsController < ApplicationController
  # GET /backlogs
  # GET /backlogs.xml
  def index
    @backlogs = Backlog.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @backlogs }
    end
  end

  # GET /backlogs/1
  # GET /backlogs/1.xml
  def show
    @backlog = Backlog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @backlog }
    end
  end

  # GET /backlogs/new
  # GET /backlogs/new.xml
  def new
    @backlog = Backlog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @backlog }
    end
  end

  # GET /backlogs/1/edit
  def edit
    @backlog = Backlog.find(params[:id])
  end

  # POST /backlogs
  # POST /backlogs.xml
  def create
    @backlog = Backlog.new(params[:backlog])

    respond_to do |format|
      if @backlog.save
        flash[:notice] = 'Backlog was successfully created.'
        format.html { redirect_to(@backlog) }
        format.xml  { render :xml => @backlog, :status => :created, :location => @backlog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @backlog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /backlogs/1
  # PUT /backlogs/1.xml
  def update
    @backlog = Backlog.find(params[:id])

    respond_to do |format|
      if @backlog.update_attributes(params[:backlog])
        flash[:notice] = 'Backlog was successfully updated.'
        format.html { redirect_to(@backlog) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @backlog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /backlogs/1
  # DELETE /backlogs/1.xml
  def destroy
    @backlog = Backlog.find(params[:id])
    @backlog.destroy

    respond_to do |format|
      format.html { redirect_to(backlogs_url) }
      format.xml  { head :ok }
    end
  end
end
