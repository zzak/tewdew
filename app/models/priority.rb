class Priority < ActiveRecord::Base
  
  validates_presence_of :name, :color
  
  has_many :tasks
end
