ENV['RACK_ENV'] = 'test'

require 'main'
require 'test/unit'
require 'rack/test'

class TewdewTest < Test::Unit::TestCase
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end
  
  def test_it_gets_tasks
    get '/tasks'
    assert last_response.ok?
  end
  
  def test_it_adds_task
    post '/add', :title => "test task"
    assert last_response.ok?
  end
  
  def test_it_gets_edit_form
    @task = Task.create(
      :title => "test task",
      :created_at => Time.now
    )
    get "/edit/#{@task.id}"
    assert last_response.ok?
  end
  
  def test_it_updates_task
    @task = Task.create(
      :title => "test task",
      :created_at => Time.now
    )
    put '/update', :task_id => @task.id
    assert last_response.ok?
  end
  
  def test_it_deletes_task
    @task = Task.create(
      :title => "test task",
      :created_at => Time.now
    )
    delete '/delete', :task_id => @task.id
    assert last_response.ok?
  end
end