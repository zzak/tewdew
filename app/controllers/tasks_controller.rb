class TasksController < ApplicationController
before_filter :authenticate_user!

  # GET /tasks
  # GET /tasks.xml
  def index
    @tasks = Task.all(:conditions=>{:user_id => current_user}, :order=>"status ASC, priority_id ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.xml
  def show    
    respond_to do |format|
      format.html { redirect_to :action=>"index" }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.xml
  def new
    @task = Task.new
    @priorities = Priority.all
    @lists = List.all(:conditions=>{:user_id => current_user})

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
    if @task.user != current_user
      redirect_to(:controller=>"lists", :action=>"show", :id=>@task.list)
    end
    @priorities = Priority.all
    @lists = List.all(:conditions=>{:user_id => current_user})
  end

  # POST /tasks
  # POST /tasks.xml
  def create
    @task = Task.new(params[:task])
    @task.user = current_user

    respond_to do |format|
      if @task.save
        flash[:notice] = 'Task was successfully created.'
        format.html { redirect_to(:controller=>"lists", :action=>"show", :id=>@task.list) }
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
    @task = Task.find(params[:id])
    if @task.user == current_user
      respond_to do |format|
        if @task.update_attributes(params[:task])
          flash[:notice] = "Task was successfully updated."
        format.html { redirect_to(:controller=>"lists", :action=>"show", :id=>@task.list) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
        end
      end
    else
      redirect_to(:controller=>"lists", :action=>"show", :id=>@task.list)
    end
  end
  
  def updatestatus
    @task = Task.find(params[:id])
    if @task.user == current_user
      @task.status = true
      respond_to do |format|
        if @task.save
          flash[:notice] = "Task was successfully updated."
        format.html { redirect_to(:controller=>"lists", :action=>"show", :id=>@task.list) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
        end
      end
    else
      redirect_to(:controller=>"lists", :action=>"show", :id=>@task.list)
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.xml
  def destroytask
    @task = Task.find(params[:id])
    @list = @task.list
    if @task.user == current_user
      @task.destroy

      respond_to do |format|
        format.html { redirect_to(:controller=>"lists", :action=>"show", :id=>@list) }
        format.xml  { head :ok }
      end
    else
      redirect_to(:controller=>"lists", :action=>"show", :id=>@task.list)
    end
  end
end
