class Task
  include DataMapper::Resource
  include DataMapper::Validate
  
  property :id, Serial
  property :title, String
  property :status, Boolean, :default => false
  property :created_at, DateTime
  
  belongs_to :account

  # Validations
  validates_presence_of      :title


end
