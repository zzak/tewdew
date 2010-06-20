
class Task
  include DataMapper::Resource

  property :id,         Serial
  property :title,      String, :required => true
  property :status,       Boolean, :default => false
  property :created_at, DateTime
end

DataMapper.finalize