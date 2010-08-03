require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'dm-core'
require 'dm-migrations'
require 'dm-validations'
require 'twitter_oauth'

configure :test do 
  puts 'Test configuration in use'
  DataMapper.setup(:default, 'sqlite::memory:')
  set :sessions, true
  @@config = YAML.load_file("config.yml") rescue nil || {}
end 

configure :development do 
  puts 'Development configuration in use'
  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, "sqlite://#{Dir.pwd}/db/development.db")
  set :sessions, true
  @@config = YAML.load_file("config.yml") rescue nil || {}
end

configure :production do
  # production mode
  DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://my.db')
  set :sessions, true
  @@config = YAML.load_file("config.yml") rescue nil || {}
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
  before do
    @user = session[:user]
    @client = TwitterOAuth::Client.new(
      :consumer_key => @@config['consumer_key'],
      :consumer_secret => @@config['consumer_secret'],
      :token => session[:access_token],
      :secret => session[:secret_token]
    )
    @rate_limit_status = @client.rate_limit_status
  end

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
  
  get '/connect' do
    request_token = @client.request_token
    session[:request_token] = request_token.token
    session[:request_token_secret] = request_token.secret
    redirect request_token.authorize_url  
  end

  get '/auth' do
    # Exchange the request token for an access token.
    @access_token = @client.authorize(
      session[:request_token],
      session[:request_token_secret]
    )
    
    if @client.authorized?
        session[:access_token] = @access_token.token
        session[:secret_token] = @access_token.secret
        session[:user] = true
        redirect '/tasks'
      else
        redirect '/'
    end
  end

  get '/disconnect' do
    session[:user] = nil
    session[:request_token] = nil
    session[:request_token_secret] = nil
    session[:access_token] = nil
    session[:secret_token] = nil
    redirect '/'
  end
end

