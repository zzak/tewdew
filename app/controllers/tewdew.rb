Tewdew.controllers :tewdew do
  
  get :index, :map => "/" do
    @tasks = Task.all(:order => [ :status.asc ])
    render "index"
  end
  
  get :stylesheet, :map => "/stylesheet.css" do
    render "styles"
  end

  get :tasks, :map => '/tasks' do
    @tasks = Task.all(:order => [ :status.asc ])
    render "tasks", :layout => false
  end
  
  get :addtask, :map => '/addtask' do
    render "addtask", :layout => false
  end

  post :add, :map => '/add' do
    # add a new task
    @task = Task.new(
      :title => params[:title],
      :created_at => Time.now
    )
    @task.account = session[:account]
    @task.save!
    #redirect "/"
  end

  get :edit, :map => '/edit/:id' do
    # edit a task form
    @task = Task.get(params[:id])
    render "edittask"
  end

  put :update, :map => '/update' do
    # update a task
    @task = Task.get(params[:task_id])
    @task.update(:status=>true)
    redirect "/"
  end

  delete :delete, :map => '/delete' do
    # delete a task
    @task = Task.get(params[:task_id])
    @task.destroy!
    redirect "/"
  end
end

