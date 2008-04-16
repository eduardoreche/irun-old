class TasksController < ApplicationController
  
  before_filter :load_sprint
  before_filter :load_backlog_items, :only => [:new, :create, :edit, :update]
  
  # GET /tasks
  # GET /tasks.xml
  def index
    @tasks = @sprint.tasks.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.xml
  def show
    @task = @sprint.tasks.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.xml
  def new
    @task = @sprint.tasks.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = @sprint.tasks.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.xml
  def create
    @task = @sprint.tasks.build(params[:task])

    respond_to do |format|
      if @task.save
        flash[:notice] = 'Task was successfully created.'
        format.html { redirect_to(sprint_task_path(@sprint,@task)) }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.xml
  def update
    @task = @sprint.tasks.find(params[:id])
    
    status = @task.status

    respond_to do |format|
      if @task.update_attributes(params[:task])
        
        if status != @task.status
          if @task.status == "Alocado"
            @task.user = session[:user]
            @task.init = Time.now
          end
          if @task.status == "Pronto"
              @task.end = Time.now
          end
          if @task.status == "Aberto"
              @task.end = nil
              @task.init = nil
              @task.user = nil
          end
          
          @task.save
        end
        
        flash[:notice] = 'Task was successfully updated.'
        format.html { redirect_to(sprint_task_path(@sprint,@task)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.xml
  def destroy
    @task = @sprint.tasks.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(sprint_tasks_url(@sprint)) }
      format.xml  { head :ok }
    end
  end
  
  private
  def load_sprint
    @sprint = Sprint.find(params[:sprint_id])
  end
  
  def load_backlog_items
    @backlog_items = @sprint.backlog.backlog_items.find(:all,:order => "product_id")
  end
end
