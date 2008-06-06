class CommentsController < ApplicationController
  
  before_filter :load_sprint_task
  
  # GET /comments
  # GET /comments.xml
  def index
    @comments = @task.comments.find(:all, :order => 'created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = @task.comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = @task.comments.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = @task.comments.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
    @comment = @task.comments.build(params[:comment])
    @comment.user = session[:user]

    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        format.html { redirect_to(sprint_task_path(@sprint,@task)) }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = @task.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to(sprint_task_comments_path(@sprint,@task)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = @task.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(sprint_task_comments_url) }
      format.xml  { head :ok }
    end
  end
  
  def download_attachment
    headers["Content-Type"] = "Multipart/mixed"
    
    @comment = @task.comments.find(params[:id])
    
    if @comment.attachment
      send_file "#{RAILS_ROOT}/public/uploads/attachments/#{@comment.attachment}"
    end
  end
  
  private
  def load_sprint_task
    @sprint = Sprint.find(params[:sprint_id])
    @task = @sprint.tasks.find(params[:task_id])
  end
end
