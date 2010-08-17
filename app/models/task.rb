class Task < ActiveRecord::Base
  
  validates_presence_of :title, :list
  
	belongs_to :list, :dependant => :destroy
  belongs_to :user
  belongs_to :priority, :dependant => :destroy
end
