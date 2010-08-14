class Task < ActiveRecord::Base
  
  validates_presence_of :title
  
	belongs_to :list  
  belongs_to :user
  belongs_to :priority
end
