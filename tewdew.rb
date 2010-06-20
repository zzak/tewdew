require 'rubygems'
require 'sinatra'
require 'haml'
require 'dm-core'
require 'dm-migrations'

load 'database.rb'
load 'models.rb'
load 'migrate.rb'

# Usage: partial :foo
helpers do
  def partial(page, options={})
    haml page, options.merge!(:layout => false)
  end
end

get '/' do
  @tasks = Task.all
  haml :index
end

get '/tasks' do
  @tasks = Task.all
  haml :tasks
end

post '/add' do
  # add a new task
  @task = Task.create(
    :title => params[:title],
    :created_at => Time.now
  )
end

delete '/delete/:task' do
  # delete a task
  @task = Task.get(params[:task])
  @task.destroy!
end

put '/update/:task' do
  # update a task
  @task = Task.get(params[:task])
  @task.update(
    :title => params[:title],
    :status => params[:status]
  )
  @task.save!
end