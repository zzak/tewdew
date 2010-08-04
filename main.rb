require 'rubygems'
require 'sinatra/base'
require 'haml'
require 'sass'
require 'dm-core'
require 'dm-migrations'
require 'dm-validations'
require 'sinatra_warden'

configure :test do 
  puts 'Test configuration in use'
  DataMapper.setup(:default, 'sqlite::memory:')
end 

configure :development do 
  puts 'Development configuration in use'
  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, "sqlite://#{Dir.pwd}/db/development.db")
end

configure :production do
  # production mode
  DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://my.db')
end

class Task
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :status, Boolean, :default => false
  property :created_at, DateTime
  
  belongs_to :user
end

class User
  include DataMapper::Resource
  property :id, Serial
  property :email, String, :required=>true
  property :password, Text, :required=>true

  has n, :tasks
end

DataMapper.finalize.auto_upgrade!

class Application < Sinatra::Base
  register Sinatra::Warden

  helpers do
    # Usage: partial :foo
    def partial(page, options={})

      haml page, options.merge!(:layout => false)
    end
  end

  get '/stylesheet.css' do
      content_type 'text/css', :charset => 'utf-8'
      sass :styles
  end

  get '/' do
    @tasks = Task.all(:order => [ :status.asc ])
    haml :index
  end

  get '/tasks' do
    authorize!('/login')
    @tasks = Task.all(:order => [ :status.asc ])
    haml :tasks
  end

  post '/add' do
    authorize!('/login')
    # add a new task
    @task = Task.create(
      :title => params[:title],
      :created_at => Time.now
    )
    #redirect "/"
  end

  get '/edit/:id' do
    authorize!('/login')
    # edit a task form
    @task = Task.get(params[:id])
    haml :edittask
  end

  put '/update' do
    authorize!('/login')
    # update a task
    @task = Task.get(params[:task_id])
    @task.update(:status=>true)
    redirect "/"
  end

  delete '/delete' do
    authorize!('/login')
    # delete a task
    @task = Task.get(params[:task_id])
    @task.destroy!
    redirect "/"
  end
end

